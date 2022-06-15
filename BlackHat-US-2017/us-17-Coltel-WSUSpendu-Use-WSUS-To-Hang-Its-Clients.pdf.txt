ANSSI

WEDNESDAY, 26TH JULY 2017

WSUSpendu

USE WSUS TO HANG ITS CLIENTS

Yves Le Provost & Romain Coltel

YVES LE PROVOST & ROMAIN COLTEL

WSUSPENDU

/ 125

Who we are, what we do...
- Yves Le Provost - Security auditor for more than 10 years - Currently works for French cyber defense Agency (ANSSI) - Specializes in SCADA and database assessments, but masters any other field ;-)
- Romain Coltel - Former security auditor - Currently works for a disruptive startup - Developing next-gen Active Directory security product

Yves Le Provost & Romain Coltel

WSUSPENDU

2 / 125

How do you compromise an Active Directory domain?

Yves Le Provost & Romain Coltel

WSUSPENDU

3 / 125

Sample of an Active Directory domain

Users workstations
Yves Le Provost & Romain Coltel

Servers
WSUSPENDU

Domain controllers

4 / 125

First step
1. Targeted phishing email, with malware: get a foothold in the network

Users workstations
Yves Le Provost & Romain Coltel

Servers
WSUSPENDU

Domain controllers

5 / 125

Next step
2. Propagate compromise between workstations until...

Users workstations
Yves Le Provost & Romain Coltel

Servers
WSUSPENDU

Domain controllers

6 / 125

Next step
3. You get a server administrative account, and use it to continue propagation...

Users workstations
Yves Le Provost & Romain Coltel

Servers
WSUSPENDU

Domain controllers

7 / 125

Next step
4. Until you get an Active Directory administrative account

Users workstations
Yves Le Provost & Romain Coltel

Servers
WSUSPENDU

Domain controllers

8 / 125

Next step
5. Get domain secrets

Users workstations
Yves Le Provost & Romain Coltel

Servers
WSUSPENDU

Domain controllers

9 / 125

Game over
6. Use secrets to access all data

Users workstations
Yves Le Provost & Romain Coltel

Servers
WSUSPENDU

Domain controllers

10 / 125

How do you compromise an ESAE-managed forest?

Yves Le Provost & Romain Coltel

WSUSPENDU

11 / 125

Classic administration
Admin workstations

Production forest(s)

Various resources

Yves Le Provost & Romain Coltel

WSUSPENDU

12 / 125

Tier administration model
Production forest(s) Tier 0
Tier 1 Tier 2
Yves Le Provost & Romain Coltel

Control of enterprise identities in the environment

Control of enterprise servers and applications

Control of user workstations and devices
WSUSPENDU

13 / 125

Better administration

Production forest(s)

Tier 0

Tier 1

Tier 2

Reference: https://docs.microsoft.com/en-us/windows-server/identity/securing-privileged-access/securing-privileged-access-reference-material

Yves Le Provost & Romain Coltel

WSUSPENDU

14 / 125

So, what is an ESAE?
Enhanced Security Administrative Environment Production forest(s)

ESAE

Tier 0
Tier 1 Tier 2
Yves Le Provost & Romain Coltel

- Single forest, single domain - One-way trust, using selective authentication, with the
production forest(s) - Contains small number of ESAE administrative accounts
- Dedicated to ESAE - Contains production forest(s) tier 0 administrators
- Simple users in the ESAE forest - Only connect to tier 0 resources on production - Highly secured accounts - Workstations/servers hardened

WSUSPENDU

15 / 125

Why use an ESAE?

Users workstations
Yves Le Provost & Romain Coltel

Servers
WSUSPENDU

Domain controllers

16 / 125

Why use an ESAE?

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

17 / 125

Why use an ESAE?
- Helps protect tier 0 resources against compromise - Which helps to protect against an overall compromise

Yves Le Provost & Romain Coltel

WSUSPENDU

18 / 125

Why use an ESAE?
- Helps protect tier 0 resources against compromise - Which helps to protect against an overall compromise
- Can use the same Active Directory account to administrate multiple forests - In fact, don't use an ESAE for only one forest...

Yves Le Provost & Romain Coltel

WSUSPENDU

19 / 125

Why use an ESAE?
- Helps protect tier 0 resources against compromise - Which helps to protect against an overall compromise
- Can use the same Active Directory account to administrate multiple forests - In fact, don't use an ESAE for only one forest...
- Doesn't protect enterprise's assets, but a mandatory step to get to that

Yves Le Provost & Romain Coltel

WSUSPENDU

20 / 125

How do you compromise an ESAE-managed forest?
Well, you can't, that's the point.

Yves Le Provost & Romain Coltel

WSUSPENDU

21 / 125

What if a WSUS server serves updates to the DCs?
WSUS server
?

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

22 / 125

Can you compromise an ESAE-managed forest using a WSUS server?

Yves Le Provost & Romain Coltel

WSUSPENDU

23 / 125

Windows Server Update Services (WSUS) architecture

Microsoft Update

www

HTTPS

Enterprise network

WSUS server

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

24 / 125

Windows Server Update Services (WSUS) architecture

Microsoft Update

www

HTTPS HTTP

Enterprise network

WSUS server

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

25 / 125

Windows Server Update Services (WSUS) architecture

Microsoft Update

www

HTTPS HTTP

Enterprise network

WSUS server

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

26 / 125

WSUS server components

Microsoft Update Synchronization

Windows service

Web service

WSUS clients

Deployment

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

27 / 125

Updates journey within a WSUS server

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

28 / 125

Updates journey within a WSUS server
1. Windows service downloads update metadata (binaries size, download URL, command-line arguments, ...)

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

29 / 125

Updates journey within a WSUS server
2. Windows service transmits the metadata to the database

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

30 / 125

Updates journey within a WSUS server
3. The database uses functions to parse metadata inputs, incorporates them into its tables

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

31 / 125

Updates journey within a WSUS server
4. Updates are approved, either by an admin or by automatic approval rules

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

32 / 125

Updates journey within a WSUS server
5. Approved updates binaries (psf, cab, exe, ...) are downloaded

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

33 / 125

Updates journey within a WSUS server
6. Each binary signature is checked

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

34 / 125

Updates journey within a WSUS server
7. Each binary is stored for the Web service to be able to get them

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

35 / 125

Updates journey within a WSUS server
8. Clients are looking for new updates ; Web service gets approved updates metadata from the database

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

36 / 125

Updates journey within a WSUS server
9. Web service transmits the metadata to the WSUS clients

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

37 / 125

Updates journey within a WSUS server
10. Each client evaluates if the updates is installable

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

38 / 125

Updates journey within a WSUS server
11. If an update is installable on a client, the associated binary is downloaded

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

39 / 125

Updates journey within a WSUS server
12. Each downloaded binary's signature is checked

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

40 / 125

Updates journey within a WSUS server
13. Each binary is executed, with SYSTEM privileges, with possible command line parameters from the metadata

Microsoft Update

Windows service

Web service

WSUS clients

Yves Le Provost & Romain Coltel

Database WSUS server
WSUSPENDU

41 / 125

How to connect to the database
HKLM\Software\Microsoft\Update Services\Server\Setup
Initial configuration

Yves Le Provost & Romain Coltel

WSUSPENDU

42 / 125

How to connect to the database
HKLM\Software\Microsoft\Update Services\Server\Setup
SqlServerName = "MICROSOFT##WID" 

Yves Le Provost & Romain Coltel

WSUSPENDU

43 / 125

What's in the database?
Everything: - Full WSUS configuration - Updates metadata - Approvement states -...
Some stats: - 31 views - 35 triggers - 52 functions - 108 tables - 380 stored procedures

Yves Le Provost & Romain Coltel

WSUSPENDU

44 / 125

State-of-the-art
WSUS attacks: Black Hat USA 2015, WSUSpect
Enterprise network

Microsoft Update
Yves Le Provost & Romain Coltel

WSUS server
WSUSPENDU

WSUS clients
45 / 125

State-of-the-art
1. Get a mitm position
Microsoft Update
Yves Le Provost & Romain Coltel

Enterprise network
WSUSpect
WSUS server
WSUSPENDU

WSUS clients
46 / 125

State-of-the-art
2. Intercepts new update queries

Enterprise network
WSUSpect

Microsoft Update
Yves Le Provost & Romain Coltel

WSUS server
WSUSPENDU

WSUS clients
47 / 125

State-of-the-art
3. Infects the on-network metadata with a new, malicious update
Enterprise network
WSUSpect

Microsoft Update
Yves Le Provost & Romain Coltel

WSUS server
WSUSPENDU

WSUS clients
48 / 125

State-of-the-art
4. The client sees a new available and installable update

Enterprise network
WSUSpect

Microsoft Update
Yves Le Provost & Romain Coltel

WSUS server
WSUSPENDU

WSUS clients
49 / 125

State-of-the-art
5. Fetches the related binary
Microsoft Update
Yves Le Provost & Romain Coltel

Enterprise network
WSUSpect
WSUS server
WSUSPENDU

WSUS clients
50 / 125

State-of-the-art
6. Checks if binary signature is okay: it is.

Enterprise network
WSUSpect

Microsoft Update
Yves Le Provost & Romain Coltel

WSUS server
WSUSPENDU

WSUS clients
51 / 125

State-of-the-art
7. Installs the binary, with SYSTEM privileges, with metadata command-line arguments
Enterprise network
WSUSpect

Microsoft Update
Yves Le Provost & Romain Coltel

WSUS server
WSUSPENDU

WSUS clients
52 / 125

State-of-the-art
WSUS attacks: Black Hat USA 2015, WSUSpect
Awesome attack!
But some limitations: - Gain a mitm position
- Meaning no network limitation is in place - Get a useful one
- Meaning TLS has to be disabled
Doesn't give us access to the ESAE-managed domain controllers

Yves Le Provost & Romain Coltel

WSUSPENDU

53 / 125

So, where are we?
We know: - That injecting into the metadata between WSUS server/client is possible - Where metadata are stored: in the database - How to connect to this database
We want: - To inject a metadata to compromise a client, without a network attack

Yves Le Provost & Romain Coltel

WSUSPENDU

54 / 125

So, where are we?
We know: - That injecting into the metadata between WSUS server/client is possible - Where metadata are stored: in the database - How to connect to this database
We want: - To inject a metadata to compromise a client, without a network attack
So, let's try to inject a new update into the database!

Yves Le Provost & Romain Coltel

WSUSPENDU

55 / 125

So, where are we?
We know: - That injecting into the metadata between WSUS server/client is possible - Where metadata are stored: in the database - How to connect to this database
We want: - To inject a metadata to compromise a client, without a network attack
So, let's try to inject a new update into the database!
...let's start by studying how updates are inserted...

Yves Le Provost & Romain Coltel

WSUSPENDU

56 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables

Yves Le Provost & Romain Coltel

WSUSPENDU

57 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables

Yves Le Provost & Romain Coltel

WSUSPENDU

58 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables

Yves Le Provost & Romain Coltel

WSUSPENDU

59 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger...

Yves Le Provost & Romain Coltel

WSUSPENDU

60 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger... - Read and understand the trigger

Yves Le Provost & Romain Coltel

WSUSPENDU

61 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger... - Read and understand the trigger - Try to respect this trigger by inserting into another table

Yves Le Provost & Romain Coltel

WSUSPENDU

62 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger... - Read and understand the trigger - Try to respect this trigger by inserting into another table - Second slap, this time by a foreign key...

Yves Le Provost & Romain Coltel

WSUSPENDU

63 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger... - Read and understand the trigger - Try to respect this trigger by inserting into another table - Second slap, this time by a foreign key... - Study the relation between tables

Yves Le Provost & Romain Coltel

WSUSPENDU

64 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger... - Read and understand the trigger - Try to respect this trigger by inserting into another table - Second slap, this time by a foreign key... - Study the relation between tables - Take an aspirin

Yves Le Provost & Romain Coltel

WSUSPENDU

65 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger... - Read and understand the trigger - Try to respect this trigger by inserting into another table - Second slap, this time by a foreign key... - Study the relation between tables - Take an aspirin - Try to insert data into a table to respect the trigger and the foreign keys constraints

Yves Le Provost & Romain Coltel

WSUSPENDU

66 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger... - Read and understand the trigger - Try to respect this trigger by inserting into another table - Second slap, this time by a foreign key... - Study the relation between tables - Take an aspirin - Try to insert data into a table to respect the trigger and the foreign keys constraints - Get kicked by another trigger

Yves Le Provost & Romain Coltel

WSUSPENDU

67 / 125

How to check for inserted rows on SQLServer?
First try: - Look for update information in tables - Find update information in some tables - Try to insert data in one of the identified tables - Get slapped by a trigger... - Read and understand the trigger - Try to respect this trigger by inserting into another table - Second slap, this time by a foreign key... - Study the relation between tables - Take an aspirin - Try to insert data into a table to respect the trigger and the foreign keys constraints - Get kicked by another trigger... - Throw laptop across the room

Yves Le Provost & Romain Coltel

WSUSPENDU

68 / 125

How to check for inserted rows on SQLServer?
Second try: - Define triggers on tables (remember: 108 tables) to trace inserts - Get SQLServer to activate audit logs Way too complicated...

Yves Le Provost & Romain Coltel

WSUSPENDU

69 / 125

SQL profiler to the rescue
- Monitors SQL queries as done on the database - Use it while WSUS is synchronizing with Microsoft Update Import update sample:

Notice the horizontal slider? It's a very large XML

Yves Le Provost & Romain Coltel

WSUSPENDU

70 / 125

Isolate the right calls
- WSUS service is only using stored procedure calls
- Calls five stored procedures to insert one update: - spImportUpdate - spSaveXmlFragment (actually called a bunch of times) - spSetBatchURL - spDeploymentAutomation - spProcessPrerequisitesForRevision

Yves Le Provost & Romain Coltel

WSUSPENDU

71 / 125

Isolate the right calls
- WSUS service is only using stored procedure calls
- Calls five stored procedures to insert one update: - spImportUpdate - spSaveXmlFragment (actually called a bunch of times) - spSetBatchURL - spDeploymentAutomation - spProcessPrerequisitesForRevision

Yves Le Provost & Romain Coltel

WSUSPENDU

72 / 125

Copy/Paste a valid update
- Lessons learned: - Image-typed columns can store cab files - Which can store a file named "blob" - Which can store an even bigger XML - Ones bigger than SQLServer's NVARCHAR max size (8K)
spSaveXmlFragment NULL,4D53434600000000FB07...
MSCF: Cabinet file
"blob"

Yves Le Provost & Romain Coltel

WSUSPENDU

73 / 125

Copy/Paste a valid update
- Lessons learned: - Minimalization cannot be pushed too far - Works on Windows 7 and Windows 10:1607

Yves Le Provost & Romain Coltel

WSUSPENDU

1607
74 / 125

Copy/Paste a valid update
- Lessons learned: - Minimalization cannot be pushed too far - Works on Windows 7 and Windows 10:1607 - Doesn't work on versions in-between - Doesn't work on server versions

2008(R2)
Yves Le Provost & Romain Coltel

1511
2012(R2)
WSUSPENDU

1607
2016

75 / 125

Introducing WSUSpendu@
Open-source: https://github.com/AlsidOfficial/WSUSpendu
Enterprise network

Microsoft Update

www

WSUS server

@ Thx Maman
Yves Le Provost & Romain Coltel

WSUSPENDU

WSUS clients
76 / 125

Introducing WSUSpendu
1. Injects update metadata in the database, signed binary in the Web service
Enterprise network

Microsoft Update

www

WSUS server

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

77 / 125

Introducing WSUSpendu
2. The client sees a new available and installable update

Enterprise network

Microsoft Update

www

WSUS server

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

78 / 125

Introducing WSUSpendu
3. Fetches the related binary

Microsoft Update

www

Enterprise network
WSUS server

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

79 / 125

Introducing WSUSpendu
4. Checks if binary signature is okay: it is.

Microsoft Update

www

Enterprise network
WSUS server

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

80 / 125

Introducing WSUSpendu
5. Installs the binary, with SYSTEM privileges, with metadata command-line arguments
Enterprise network

Microsoft Update

www

WSUS server

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

81 / 125

Demonstration...

Yves Le Provost & Romain Coltel

WSUSPENDU

82 / 125

What if a WSUS server serves updates to the DCs?
WSUS server
?

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

83 / 125

Compromise an ESAE-managed forest
WSUS server

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

84 / 125

Compromise an ESAE-managed forest
WSUS server

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

85 / 125

Sometimes, even compromise the ESAE forest itself

Production forest(s)

ESAE

Tier 0
Tier 1 Tier 2
Yves Le Provost & Romain Coltel

- WSUS server in the ESAE, which distributes its updates to the ESAE resources

WSUSPENDU

86 / 125

Sometimes, even compromise the ESAE forest itself

Production forest(s)

ESAE

Tier 0
Tier 1 Tier 2
Yves Le Provost & Romain Coltel

- WSUS server in the ESAE, which distributes its updates to the ESAE resources
- This WSUS server takes its updates from the production environment - Not in Microsoft ESAE's blueprint, but happens ¯\()/¯

WSUSPENDU

87 / 125

Sometimes, even compromise the ESAE forest itself

Production forest(s)

ESAE

Tier 0
Tier 1 Tier 2
Yves Le Provost & Romain Coltel

- WSUS server in the ESAE, which distributes its updates to the ESAE resources
- This WSUS server takes its updates from the production environment - Not in Microsoft ESAE's blueprint, but happens ¯\()/¯
- Technically possible due to WSUS server-chaining

WSUSPENDU

88 / 125

Upstream/Downstream update servers notion
Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

89 / 125

Upstream/Downstream update servers notion
Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS1

WSUS1 clients

Yves Le Provost & Romain Coltel

WSUS2
WSUSPENDU

90 / 125

Upstream/Downstream update servers notion
Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS1

WSUS1 clients

Yves Le Provost & Romain Coltel

WSUS2
WSUSPENDU

WSUS2 clients
91 / 125

Upstream/Downstream update servers notion
Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS Upstream

WSUS clients

Yves Le Provost & Romain Coltel

WSUS Downstream
WSUSPENDU

WSUS clients
92 / 125

Upstream/Downstream update servers notion
Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS Upstream

WSUS clients

Yves Le Provost & Romain Coltel

WSUS Downstream
WSUSPENDU

WSUS clients
93 / 125

Upstream/Downstream update servers notion
Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS Upstream

WSUS clients

Yves Le Provost & Romain Coltel

WSUS Downstream
WSUSPENDU

WSUS clients
94 / 125

Upstream/Downstream update servers notion
Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS Downstream

WSUS clients

Yves Le Provost & Romain Coltel

WSUS Downstream
WSUSPENDU

WSUS clients
95 / 125

Upstream/Downstream update servers notion
Enterprise network

Upstream Microsoft Update

www

HTTPS HTTP

WSUS Downstream

WSUS clients

Yves Le Provost & Romain Coltel

WSUS Downstream
WSUSPENDU

WSUS clients
96 / 125

Compromising Microsoft's most secure environment was almost too easy.

Yves Le Provost & Romain Coltel

WSUSPENDU

97 / 125

We need to go deeper...

Yves Le Provost & Romain Coltel

WSUSPENDU

98 / 125

Disconnected network case

Internet-connected network
Yves Le Provost & Romain Coltel

WSUSPENDU

99 / 125

Disconnected network case
Physical boundary

Internet-connected network
Yves Le Provost & Romain Coltel

WSUSPENDU

Disconnected network

100 / 125

Using disconnected network
Why? - Protect sensitive data, classified information - Protect industrial networks - Just don't want to be connected to the Internet...

Yves Le Provost & Romain Coltel

WSUSPENDU

101 / 125

Using disconnected network
Why? - Protect sensitive data, classified information - Protect industrial networks - Just don't want to be connected to the Internet...
For which security improvement? - Isolation as protection - "No reach, no issue"

Yves Le Provost & Romain Coltel

WSUSPENDU

102 / 125

Using disconnected network
Why? - Protect sensitive data, classified information - Protect industrial networks - Just don't want to be connected to the Internet...
For which security improvement? - Isolation as protection - "No reach, no issue"
Is it sufficient? ... Due to sensitivity, you have to: - continue securing your network/servers/apps/... - thus, stay up-to-date

Yves Le Provost & Romain Coltel

WSUSPENDU

103 / 125

Updates for disconnected network

Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS

WSUS clients

Yves Le Provost & Romain Coltel

WSUSPENDU

104 / 125

Updates for disconnected network

Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS

WSUS clients

Yves Le Provost & Romain Coltel

External device
WSUSPENDU

105 / 125

Updates for disconnected network

Enterprise network

Microsoft Update

www

HTTPS HTTP

WSUS

WSUS clients

Yves Le Provost & Romain Coltel

External device
WSUSPENDU

WSUS on disconnected network
106 / 125

Get updates to the disconnected network
Microsoft solution: - wsusutil, export / import tool for metadata - Binaries need to be transfered manually

Yves Le Provost & Romain Coltel

WSUSPENDU

107 / 125

Get updates to the disconnected network
Microsoft solution: - wsusutil, export / import tool for metadata - Binaries need to be transfered manually

Mostly-used solution: - WSUS on a Virtual Machine - Clone the VM - Transfer the clone onto the disconnected network

Yves Le Provost & Romain Coltel

WSUSPENDU

108 / 125

WSUSpendu & disconnected network
Once metadata are imported, still needs approbation - Approbation through auto-approval rules - Social Engineering
Airgap-attack ready - Inject malicious update in database - Disconnected database is syncronised with connected database - Update is approved and deployed - Payload is executed on designated target...

Yves Le Provost & Romain Coltel

WSUSPENDU

109 / 125

Demonstration...

Yves Le Provost & Romain Coltel

WSUSPENDU

110 / 125

Compromise a disconnected network
Physical boundary

Internet-connected network
Yves Le Provost & Romain Coltel

WSUSPENDU

Disconnected network

111 / 125

Compromise a disconnected network
Physical boundary

Internet-connected network
Yves Le Provost & Romain Coltel

WSUSPENDU

Disconnected network

112 / 125

Compromise a disconnected network
Physical boundary

Internet-connected network
Yves Le Provost & Romain Coltel

WSUSPENDU

Disconnected network

113 / 125

That's scary and all good, but how do I protect myself?

Yves Le Provost & Romain Coltel

WSUSPENDU

114 / 125

How to protect your architecture
WSUS recommendations - Activate TLS

Yves Le Provost & Romain Coltel

WSUSPENDU

115 / 125

How to protect your architecture
WSUS recommendations - Activate TLS - Include WSUS server in tier-0
WSUS server

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

www
116 / 125

How to protect your architecture
WSUS recommendations - Activate TLS - Include WSUS server in tier-0

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

www
117 / 125

How to protect your architecture
WSUS recommendations - Activate TLS - Include WSUS server in tier-0

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

www
118 / 125

How to protect your architecture
WSUS recommendations - Activate TLS - Include WSUS server in tier-0

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

www
119 / 125

How to protect your architecture
WSUS recommendations - Activate TLS - Include WSUS server in tier-0
WSUS server

Tier 2
Yves Le Provost & Romain Coltel

Tier 1
WSUSPENDU

Tier 0

www
120 / 125

How to protect your architecture
WSUS recommendations - Activate TLS - Include WSUS server in tier-0 - Independant network Independant WSUS server
www

Yves Le Provost & Romain Coltel

Internet-connected network

Disconnected network

Physical boundary

WSUSPENDU

121 / 125

How to protect your architecture
WSUS recommendations - Activate TLS - Include WSUS server in tier-0 - Independant network Independant WSUS server
Dedicated network
www

Yves Le Provost & Romain Coltel

Internet-connected network

Disconnected network

Physical boundary

WSUSPENDU

122 / 125

How to protect your architecture
WSUS recommendations - Activate TLS - Include WSUS server in tier-0 - Independant network Independant WSUS server
Dedicated network
www

Yves Le Provost & Romain Coltel

Internet-connected network

Disconnected network

Physical boundary

WSUSPENDU

123 / 125

How to protect your architecture
Seen on a Windows 10 1703 (Creators update): "[metadataintegrity]GetFragmentSigningConfig failed with 0x8024402C. Using default enforcement mode: Audit."

Yves Le Provost & Romain Coltel

WSUSPENDU

124 / 125

Conclusion

Stop updating

Yves Le Provost & Romain Coltel

WSUSPENDU

125 / 125

Conclusion
Stop updating Control relationship WSUS server  clients

Yves Le Provost & Romain Coltel

WSUSPENDU

126 / 125

ROMAIN COLTEL

ANSSI
YVES LE PROVOST
Thank you all.

Yves Le Provost & Romain Coltel

WSUSPENDU

/ 125

