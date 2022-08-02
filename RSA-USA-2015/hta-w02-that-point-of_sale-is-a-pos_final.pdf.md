SESSION ID: HTA-W02
That Point of Sale is a PoS

Charles Henderson
Vice President ­ Managed Security Testing Trustwave @angus_tx

David Byrne
Senior Security Associate Bishop Fox

#RSAC

#RSAC
Agenda
 POS Architecture  Breach Investigations  Testing Techniques  Penetration Test Findings
2

#RSAC
PoS Attacks: Theory vs. Reality
 Most breaches involve very simple vulnerabilities  Future breaches are likely to leverage more complex vulnerabilities
as merchants become more secure  Many merchants have very immature security programs
3

#RSAC
PoS Purchasing: Security Is Not A Criteria
4

#RSAC
Point of Sale Architecture

#RSAC
Hardware
 Standard PC workstation  Specialized peripherals
 Card reader and PIN pad  Barcode scanner  Touch screen ­ much less "specialized" than it used to be  Expanded keyboard  Scale  Customer display

#RSAC
Hardware
 Interfaces
 USB  RS-232 ­ becoming less common  TIA-485/RS-485 ­ rare in 2015  Ethernet ­ some PIN pads and printers can connect directly to network
7

#RSAC
Client Operating System and Software
 Windows dominates  Some Linux  Occasional use of network boot with no local storage  Even large retailers use off the shelf packages that are customized
to the client
8

#RSAC
Application Servers
 Many separate systems:
 Transaction records (purchases, refunds, etc.)  Payment card processing  Promotions  Customer tracking  Gift cards
 May be from entirely different vendors; more likely to see custom software in larger merchants
9

#RSAC
Application Servers
 In larger environments, typically implemented as middleware services: XML web services, etc.
 Small environments (isolated stores) likely to store all data on register.
10

#RSAC
Remote Administration
 Major source of compromise  Registers will almost always have remote administration services  Small organizations typically outsource administration  Large chains will still not have on-site technical support
11

#RSAC
Breach Investigations

#RSAC
Attacks Become More Efficient
 Physical Modifications (External)  Physical Modifications (Internal)  Drive-By Malware  Scalable Malware
13

#RSAC
Physical Attacks (Internal)
14

#RSAC
Physical Attacks (Internal)
15

#RSAC
Physical Attacks (Internal)
16

#RSAC
Forensics Case Study One: Vendor Negligence

 Same administrator password for nine years
 Attackers most likely discovered merchant in breach of other merchant using same vendor

Username

: Administrator [500]

Full Name

:

User Comment : Built-in account for

administering the computer/domain

Account Created : Xxx Xxx XX XX:XX:XX 2004

Last Login Date : Xxx Xxx XX XX:XX:XX 2013

Pwd Reset Date : Xxx Xxx XX XX:XX:XX 2005

Pwd Fail Date : Xxx Xxx XX XX:XX:XX 2014

Login Count

: 261

Password does not expire

Normal user account

17

#RSAC
Forensics Case Study Two: Vendor Negligence

 Attacker installs memory-scraping malware
 Data was manually retrieved by attacker; memory dumps left on PoS disk
 Malware easily discovered during investigation using current AV

Scan type: Quick scan Objects scanned: 191441 Time elapsed: 12 minute(s), 40 second(s)
Files Detected: 2 C:\WINDOWS\system32\Searcher.dll (Trojan.Clicker) -> Quarantined and deleted successfully.
C:\WINDOWS\system32\QOS.dll (Trojan.Agent) -> Quarantined and deleted successfully.

18

#RSAC
Forensics Case Study Three: Vendor Negligence
 Back of house server configured for remote management utilizing pcAnywhere
 Null Administrator password  Administrator password had not
been changed in nine years  Malware easily discovered during
investigation using current AV
19

#RSAC
Forensics Case Study Four: Origin of Malware

 Multiple workstations in CHD environment used to browse pornographic websites, download torrents, and video chat
 Keylogger installed by attacker also logged use of machines with CHD being used to play Guitar Hero 3, Call of Duty, and other games

Key Pressed: bxcvbxcvbxcvbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbxxxxxxx xxxxxxxxcvbvvvvvvvvvvvvvvvvvvvvbccxcvcvvcvbvxvcvxccc cccccccccvbxccvcbvcxxxxxxxxxxxcbcvcxbbvcxcvbvcbvcvcv cxbvcx{Esc} b{Esc}bbxcvbxcvbbvbvbvbvbvbvbbvbvbvbbbbbbbbbbbbbbbbb bbbbbbbbbbbbbbbbbbbbbbbbbbxxxxxxxxxxxxxxxcvbvvvvvvvv vvvvvvvvvvvvbcxcbcvvvvvvcvbbbbbbbvxvcvxxcccccccccvbx cvvcbvcxcbcvxbbbvcxxxcbvcbvcvcvcxvcxvcvcvcvcvbcccccc cccccccccccccccccccccccxbxcbxxcxvxbxvxcxvxvbxvxcxvxv xbbbbbvcxxxxxxxxxxxxxxxxxxxxxxvcxcccccvvvvvvvvvvvvvv bbbbbbbbxbxvxcxcbvbcvxcxccccccccccccccvccxxxxxxxxbbv xcbxbxvxcxvbbbbbbbbbbbbbbbbbbbbbcccccvxvcvcbbbbbbbvc vcbcvbxvcvcbxvcvcbcvxxxxxxxxxcvcvcbbbbbbvcvcbcvbbbbb bxvcvcbxvxvcvcvbvxbxvxvxvxcvvvvvvcbxv

20

#RSAC
Backoff Malware
 Self-propagates through weak remote access authentication
 Command and control features  Memory scraping for payment card
data  Automatic data exfiltration  Keylogging  New infections look for old versions
of Backoff to remove
21

#RSAC
Testing Strategies

#RSAC
Multiple Testing Perspectives
 Remote (routed) network access
 Vulnerable network services
 Local network access
 Proper protocol encryption  Endpoint authentication (i.e., no MitM)  Identification of second-tier application servers

#RSAC
Multiple Testing Perspectives
 Momentary physical access
 Introduction of malicious device ­ key-logger, network adapter, USB attacks, IEEE 1394 DMA, etc.
 Prolonged physical access
 Hard drive encryption  Local storage of sensitive data (i.e., payment card numbers)  Analysis of application binaries  Monitoring and modification of key peripherals (i.e. PIN pad)
24

#RSAC
Multiple Testing Perspectives
 Console interaction
 Execution of unauthorized and malicious programs  Escalation of system privileges  Modification of PoS application  Monitoring of network and peripheral communication  Memory dumps
25

#RSAC
Physical Security
 Quality of locks  Exposed network cables, drops
26

#RSAC
Penetration Testing Results

#RSAC
Physical Security
 This is not good physical security  Easy access to USB, Ethernet, etc
28

Physical Security

#RSAC
 This is not a good lock

29

#RSAC
166816 (Z66816)
 Since 1990, this has been the default password for all products from a major vendor
 Publically documented in a 1994 alt.2600 FAQ (featuring terms like "sysop" and company names like "Northern Telecom")
 90% of the terminals of this brand we test for the first time still have this code
30

#RSAC
Improper Use of Symmetric Keys
 Symmetric algorithms: one key for both encryption and decryption
 Asymmetric algorithms: decryption & encryption keys separate
 Using symmetric algorithms for payment card data invites abuse
31

#RSAC
Operating System Security
 Most POS deployments are overly reliant on passwords
 Very difficult to secure OS passwords on endpoint
 AV scanning isn't perfect, but still important  Easy to introduce custom malicious executables  No drive encryption
 Simplifies offline attacks  Allows stolen devices to be used for analysis  Devices get stolen
32

#RSAC
Authentication Fail
 Single set of authentication credentials across enterprise  Automatic Windows login and local enforcement of POS user
authentication ­ no authentication against networked application services
33

#RSAC
Running as administrator
 Vendors often claim that this is a requirement.
 Lies, nothing but lies.  Windows and Unix-like operating
systems have never worked this way.  Simply an excuse for lazy programmers
34

#RSAC
PIN Pad Debug Triggered
35

#RSAC
Plaintext Network Traffic
Note the protocol. This is not IP.
36

#RSAC
Running Unauthorized Programs
 This is how malware infections start
37

#RSAC
Network Communication Security Flaws
 Plaintext communication  Failure to authenticate endpoints
 SSL is next to useless without certificate verification
38

#RSAC
Encryption Insanity
 Symmetric encryption used for transmission of payment cards  Point-to-point-to-point encryption (one too many points)*  XOR to protect passwords; programmers are always amazed that
we can reverse this
* Note: The addition of more points does not enhance security posture. 39

#RSAC
PIN Pad Security
 Default configuration often insecure  Can almost always be reprogrammed from register
 Convenient way of implementing management across enterprise  Some code is cryptographically signed  Configuration is almost never signed  Attacker may be able to disable security controls such as end-to-end
encryption
40

#RSAC
PAN Abuse
 Coupon printer using PAN to track customers  PAN returned to PoS for truncation  Purchase history stored for tracking fraud ­ 37 million numbers  Adding drives to register store growing debug transaction logs
41

#RSAC
Card Numbers in RAM
42

#RSAC
Symlink to Access Filesystem
43

Apply:

#RSAC

PoS Security Program

#RSAC
Implement a PoS Security Program
 Always verify the security claimed to be implemented by vendors  Top priorities:
 Ensure no payment card data is stored on registers  Enforce strong authentication policies  Don't run PoS user interface as "administrator"  Stay current on patches and AV signatures
45

#RSAC
Implement a PoS Security Program
 Secondary priorities:
 Evaluate security of data communication (encryption, certificate checks, etc.)
 Pen test application servers for application vulnerabilities  Lock down client execution environment
 Final efforts:
 Use strong authentication (key/certificate-based)  Implement end-to-end encryption with asymmetric keys
46

#RSAC
Q & A

