SESSION ID: BR-T10
Inception: APT Campaign Spanning PCs, Mobile, the Cloud, and Home Routers

Snorre Fagerland
Sr. Principal Security Researcher Blue Coat Systems @SnorreFagerland

Waylon Grange
Sr. Threat Researcher Blue Coat Systems @professor__plum

#RSAC

#RSAC
What is Inception?
2

#RSAC
Who was targeted?
 Government  Embassies  Politics  Finance  Military  Engineering  United Nations Members  World Petroleum Council
3

#RSAC
Phishing emails
4

Attack vector
Installer vbs

Polymorphed dll

Decrypter dll

Phishing email

Exploit doc

Encrypted blob

Implant dll

Decoy doc

#RSAC
Additional capabilities

5

#RSAC
Base implant

{ 'UserName': u'q', 'ServicePack': 'Service Pack 3', 'ComputerName': u'2-696316AB411A4', 'ModuleName': u'C:\\WINDOWS\\system32\\regsvr32.exe', 'SystemLCID': '0x419', 'SystemDrive': u'C:\\', 'isAdmin': True, 'UserLCID': '0x419', 'Time': '2014-8-5 17:47:0', 'OSVersion': '5.1.2600.2', 'VolumeSerial': `0xb48f8edc' }

 Pulls basic survey information from target and uploads this information every ±15 minutes
 Can retrieve additional functionality from command and control servers.
 We've observed the following additional capabilities downloaded  Dir/File walk  Survey domain information  System hardware survey  Enumerate all installed software  Upload files of interest to c&c  doc/x, xls/x, ppt/x, pdf

6

#RSAC
Command and control via the cloud
 Utilized cloud hosting provider Cloudme.com  All data over WEBDAV  Via WNetAddConnection call
7

#RSAC
Communication channel
 Interchangeable cloud service  All comms with C&C server are encrypted
with 256bit AES  Unique encryption key for each sample  Attacks against same target share same account  Data is exchange via files dropped in configured folders  Data from victim is given a selected extension to blend in on cloud server
8

#RSAC
Chinese APT tie

Victims Researchers

 In some instances we noticed this executable being dropped
 Known to be associated with a Chinese APT group  Is a simple C&C backdoor whose functionality overlaps
with already in place backdoor  C&C domain for this sample expired shortly after being
observed  Coding skill behind this sample far inferior
'ModuleName': u'C:\\Windows\\system32\\regsvr32.exe' 'ModuleName': u'C:\\Windows\\SysWOW64\\regsvr32.exe'
'ModuleName': u'C:\\analysis\\ollyclean\\LOADDLL.EXE' 'ModuleName': u'C:\\Windows\\system32\\rundll32.exe'
9

#RSAC
A dream within a dream
10

Cloudme logs
 Cloudme provided access logs for an account
 Attackers accessed account from over 100 different IPs
 Attackers IP seemed to change on regular intervals
 Large majority of IPs came from South Korea
 IPs didn't match TOR exit nodes or any other known proxies

#RSAC
bpysrhsoaauafjbmcwrudlnfrcagdikatrihanvsrheaomlrnaoeirliansogrpadsmteonrwgo.erkn0m4lte2pnwretslieonsr5046218hl36r17i049atp278951n426a32o4l8263r0849k1o72950no27145e267084s9230ei961806r5t169a4735r5

#RSAC
Proxy network built from embedded devices
12

How do I copy?

#RSAC
 Router runs stream-line Linux  Uses busybox for basic command line
utilities  "tail-" looks fishy  Now, how to download it
 USB  SCP  FTP  TFTP  netcat  echo ­e  wget busybox w/ netcat
13

#RSAC
Router proxy malware
14

#RSAC
Attacker's infrastructure

Hacked IoT

Rented Servers

Victims

Unknown

Attackers

CloudMe

15

Turning the tables

Victims

Hacked IoT

Rented Servers

#RSAC

Unknown

Attackers

CloudMe

Analyst
16

#RSAC
More infrastructure revealed

Email Servers

Hacked IoT

Rented Servers

Victims

Unknown

Attackers

CloudMe

Analyst
17

Email servers

#RSAC
 Observed attacks uses SOCKS proxy to email servers they controlled
 Used routers to hide their identify from service providers
 Domains and servers appear to be paid for with bitcoin
 Domains look legit to victims
 haarmannsi.cz vs haarmannsi.com  sanygroup.co.uk vs sanygroup.com  ecolines.es vs ecolines.net
18

#RSAC
Mobile as a target
19

#RSAC
Phishing link
 http://82.221.100.xxx/page/index?id=target_identifier&type2=action_code  743: Serve malware disguised as WhatsApp updates  1024: Serve malware disguised as Viber updates  other: Serve MMS phishing content.
20

MMS phishing

#RSAC
 We don't have a sample of the actual MMS message
 Presumed message contained a link and a `password'
 Link from message takes victim to a simple password page
 The Logo is one of many mobile phone carriers
 We were only able to collect some of the carrier logos from the server before it was shutdown
21

#RSAC
Bitly statistics
22

#RSAC
Bitly statistics
23

Android malware
 Masked as WhatsApp Update  Upon execution installs as service and removed app icon  Is capable of gathering the following information
 Account data  Location  Contacts  External and Internal Storage (files written)  Audio (microphone)  Outgoing calls  Incoming calls  Call log  Calendar  Browser bookmarks  Incoming SMS
24

#RSAC

#RSAC
Android Comms
 Malware Connects to specific user account on common blog site  Looks for encrypted message between special HTML tags  Decodes message which points to second-tier blog site  Second-tier blog sites all appear to be compromised sites  This way attackers can easily switch out what compromised sites
are used for C&C
25

iOS malware

#RSAC
 Masked as Skype Update  Requires iPhone to be rooted with Cydia installed  Once executed deletes app and sets executable to run at reboot  Communicates with C&C via public hosting service's FTP  Is capable of gathering the following information
 Device platform, name, model, system name, system version  iTunes Account Information  Contacts  Hardware information  SMS messages  Call log  Calendar

26

#RSAC
iOS deb installer
27

#RSAC
Blackberry malware
 Masked as settings app  Is capable of gathering the following information
 Complete device hardware information (including temperature)
 Account information  Hardware information  Address book  Mobile carrier information and area code  Installed applications
28

#RSAC
Mobile red herrings
29

C&C clues

#RSAC
 Tracked when new command files were uploaded to Cloudme
 Command files took the form of [x].bin where x is incremented each time
 From this we gained a good idea how successful their campaign was
 Over 24 hours this number increased by about 100, thus 100 active targets the attackers were using
 Based on the times the files were uploaded attackers were most active from 8:00AM to 5:00PM in the Eastern European Timezone
30

RedOctober

#RSAC
 Many similarities to RedOctober attack from 2012/2013
 Some phishing documents look almost identical
 Similar exploit markers  Kaspersky notes large target
overlap between campaigns
31

#RSAC
Summary
32

#RSAC
Summary
 One of the most sophisticated malware attacks Blue Coat Labs has ever discovered  Whole setup shows signs of automation and seasoned programming  The amount of layers used in this scheme to protect the payload of their attack seems
excessively paranoid  The attackers utilize compromised embedded devices as well as multiple dedicated
hosting providers and VPN services to mask their identity  The framework is generic, and could work as an attack platform for a multitude of
purposes with very little modification  Includes malware targeting mobile devices: Android, Blackberry and iOS  Difficult to assign attribution due to false clues

#RSAC
Apply/Prevention
 Block outbound WEBDAV  Don't unlock phones  Don't install apps from unofficial sources  Keep software up-to-date  User education (phishing attacks)
34

#RSAC
Questions

#RSAC
References
 http://dc.bluecoat.com/Inception_Framework
36

