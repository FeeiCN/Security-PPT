SESSION ID: HT-W09
When cyber criminals with good OPSEC attack

Liam O'Murchu
Director Broadcom @liam_omurchu

Ryan Macfarlane
Supervisory Special Agent FBI, Cleveland Division

#RSAC

#RSAC
Bringing hackers to justice

#RSAC
Apply What You Have Learned Today
Identify key partners:
­ LE should find key researchers and establish collaboration with the help and support of your prosecution team
­ Private Sector should find an aggressive LE partner (domestic or foreign) to actually impact malicious actors
Understand the process:
­ This doesn't happen overnight: We are really in the business of waiting for mistakes to make, put yourself in a position to see as much as possible
Shape the future by doing the right thing thru collaboration:
­ These threats aren't going away, protection is important, but so is deterrence
3

#RSAC
OPSEC

#RSAC
Putting the jigsaw puzzle together
5

#RSAC
Some good rules

1. Don't talk openly 2. Don't operate from home 3. Encrypt everything 4. No logs 5. Create Personas 6. Don't contaminate 7. Don't trust 8. Be paranoid 9. Don't talk to police 10. Don't give people power over you

1. OTR, radio noise, no phone talk  2. Stolen wifi, hacked routers, proxies, TOR  3. SFTP, SSH, PGP, OTR, LUKS, Truecrypt,+  4. Logging disabled  5. Hacker Handles  6. Isolated hacking environment  7. Built all tech themselves  8. Triple encrypted drives, proxychaining  9. A lot of pressure  10. Limited inner circle 

6

#RSAC
The good news about hacker OPSEC
Flips the power dynamic Hackers only need to be right once in an attack Hunters only need to be right once in an investigation
7

#RSAC
Let's talk about their OPSEC (and what we did about it)
You are right to ask: Why did this case take so long...

#RSAC
Computer OPSEC

Linux Distro (UB) Custom boot integrity LUKS disk encryption
­ Kali & networking here
SSE ­ Custom Encryption TrueCrypt - 2 Layers VMWARE
­ "work" images (Win)

LUKS
SSE TRUECRYPT TRUECRYPT
VMWARE "Work VMs"

#RSAC
Reviewing Evidence

Secure Comms
· Stolen wifi · Proxychains in different
countries · TOR · VPNs · SSH · Sftp · PGP · OTR/Jabber

Stolen Wifi

Proxy chains TOR

#RSAC
VPN
SSH

#RSAC
So much OPSEC.
So much crime.

Activity Timeline
Hardcoded Domains CnC Hosting Human Captcha solvers Spam via webmail accounts
Auction Fraud

#RSAC

160 versions of malware Domain Generation Algorithm

P2P Encryption

Localized to 15 countries Captcha solving software
SMTP scans Password protected Zip attachments

CC Sale Ad Fraud Fake Websites Credit Card Theft
Plugin Development Big Data Processing Cryptomining

2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
13

#RSAC
Symantec undercover activity
Talk about the video and use in court

#RSAC
2016: Bayrob Browser + Big Data

#RSAC
Then one day... it got personal...

1

2

· Infected Machines Used as Proxies

· Always at least 3 hops

3 4

#RSAC

1
1:50

· Not all proxies are equal!

2

· Speed

Romania 1:50

· Open ports

· Uptime

USA

3

· Geographic location

4

1:400

1:6400

#RSAC
· Downloading AV · Checking Email · Talking on IM · Register Domains · Buy hosting · Read Forums · Ssh to CnC · Connect to Control
Panel on CnC · Email Mules · Transfer files

#RSAC
Infrastructure Overview
$$ $$
$$

How the FBI got involved...
Local complaint call
Lots of initial legal process related to the mules
Trying to follow the money
Working with Western Union
Coordinating with International partners
Applied to be a mule

#RSAC
2007
Complaint call regarding $8000.00 eBay auto auction fraud. Something was strange, so we went out a took a closer look. Found what is now called Bayrob.

#RSAC
Following the Money
Following the Money
Small number of mules, recruited via online job sites Wired the money to a number of places in Europe Money picked up with fake IDs by pro mule networks

#RSAC
PrMiveaettien/gPs uMbaltitcerCoordination
AOL had key information from VPN abuse Symantec had key malware and C2 information FBI had the ability to pursue additional coverage

#RSAC
Our shared visibility
23

#RSAC
Amounts Spreadsheet

#RSAC
Desktop screenshot
25

#RSAC
Raduspr Traffic

#RSAC
Bogdan Miclaus

#RSAC
Are we done here, or just getting started?
Expectations and perspectives vary widely based on where you sit

#RSAC
Server Search Warrants
Found lots of stuff! PHP framework, with plugin architecture CasperJS for client side scripting +JSON command and data messages Vast database with really solid tracking by soxid (unique to infected system)
Turns out they created a completely selfdocumenting cyber criminal enterprise!

#RSAC
Title III Data Intercept of multiple dedicated C2 servers
180 million products in our traffic collection tool, which was not designed for 180 million products
TIII's are hard
­ 4 months for approval, met Deputy Attorney General
­ 30 day renewals, 15 days report updates, for 6 months
There is no substitute for TIII data
­ Realtime evolution, ID'ed victims and cashout guy

#RSAC
RNP Coverage identifies connections
Identifies a house leased by raduspr in Brasov
­ Lived in by some who rarely ever comes out of the house
Identifies encrypted connections to an apartment in Bucharest
Bucharest location has other encrypted connections
No connections to Bayrob infected systems, VPNs, etc
Little Internet traffic
31

#RSAC
Subject travels to the US
Get a search warrant on subject's phone
­ Un-encrypted jabber chats re: Bayrob Code
RNP Search of apartment
­ Wanted to get some video monitoring going ­ nope
­ Keylogger ­ nope

#RSAC

#RSAC
Prosecution Phase
Hard decisions need to be made about when to go with what we have, how to introduce evidence, etc...

#RSAC
Indictment
21 count indictment Wire fraud (12 counts) Traffic in Counterfeit Service Marks (1 count) Aggravated Identity Theft (5 counts) Money Laundering (1 count) Conspiracy counts on the available statutes (2) Enhancement for False Registration of Domain name In support of criminal activity

#RSAC
Analyzing Data

#RSAC
Cell Phones

#RSAC
Travel vs Logins

#RSAC
DANET PLEAS
Confirms everything we know Identifies the majority of the group we didn't know Describes the setup Provides passwords he remembers

#RSAC
Working the human element
Associates often the weakest link in OPSEC Create a significant surface area Tell the story from the inside
40

#RSAC
Trial outcome
· Each Guilty on 21 counts
· Wire fraud (12 counts) · Traffic in Counterfeit
Service Marks (1 count) · Aggravated Identity
Theft (5 counts) · Money Laundering (1
count) · Conspiracy counts on
the available statutes (2)

#RSAC
Some good rules

1. Don't talk openly 2. Don't operate from home 3. Encrypt everything 4. No logs 5. Create Personas 6. Don't contaminate 7. Don't trust 8. Be paranoid 9. Don't talk to police 10. Don't give people power over you

1. OTR, radio noise, no phone talk  2. Stolen wifi, hacked routers, proxies, TOR  3. SFTP, SSH, PGP, OTR, LUKS, Truecrypt,+  4. Logging disabled  5. Hacker Handles  6. Isolated hacking environment  7. Built all tech themselves  8. Triple encrypted drives, proxychaining  9. A lot of pressure  10. Limited inner circle 

42

#RSAC
Questions? Thank you RSA!

