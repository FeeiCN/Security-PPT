SESSION ID: DSP-R03
POSitively Under Fire: What are Retailers Facing?

Lucas Zaichkowsky
Resolution1 Security @LucasErratus

#RSAC

Durango, CO

#RSAC

Population: 17,557

#RSAC
Serious Texas Bar-B-Q POS breach, 2010
More than 270 of the stolen credit cards used for fraud nationally
3

#RSAC
Mama's Boy POS breach, 2011
Open since the 80s, closed 4 months later
4

#RSAC
Iron Horse web site breach, 2013
2,500 web site registrations, unsure how many cards stolen
5

#RSAC
Thousands of small business are breached
 In 2010, I personally saw several dozen POS breaches  190+ POS breaches in 2013 Verizon DBIR
 Verizon is 1 of 23 PCI Forensics Investigators
 US-CERT Alert TA14-212A: July 31, 2014
 POS "Backoff" malware identified in over 1,000 US businesses
 Breached small businesses sometimes notify customers
 Post a notice on the store window
 Small merchant breaches rarely make the news in larger cities
 The media has "better" content (e.g. violent crime, celebrities)
6

#RSAC
SMB breaches are usually opportunistic
Opportunistic POS Attack Methodology: 1. Scan internet for pcAnywhere, VNC, RDP ports 2. Exploit vulnerable versions, brute force password guessing 3. Instant admin access to entire POS environment 4. Drop keystroke recorders, network sniffers, RAM scrapers 5. Automatically transmits stolen card data
7

Why so easy?!
 Small business owners use remote desktop to work remotely
 "The POS dealer keeps me safe"  "Why would hackers come after me?"
 Local POS dealers use remote desktop for support
 Most are power users  Security what?
8

#RSAC

#RSAC
Targeted Breaches

#RSAC
Examples of targeted breach victims
 2004 to 2006 - Boston Market, Barnes & Noble, Sports Authority, Forever 21
 2005 - CardSystems, DSW, Office Max  2006 - TJX Companies, Inc.  2007 - Dave & Buster's  2008 - Hannaford, Heartland, RBS WorldPay  2011 - Sony, FIS  2012 - Global Payments  2013 - Target, Neiman Marcus  2014 - P.F. Chang's, Home Depot
10

Legitimate hacking

Targeted Attack Methodology:

1.

Perform footprinting and reconnaissance

2.

Gain initial entry. Common methods...

a)

SQLi

b)

Buying backdoor access on black market

c)

Compromise a 3rd party with access

3.

System and network enumeration

4.

Privilege escalation

5.

Lateral movement to establish a beachhead

a)

Drop a diverse set of backdoors

b)

Steal user passwords, target domain controllers and file servers

6.

Find pivot points into the card data environment (CDE)

7.

Modify code or drop malware to harvest card data

8.

Exfiltrate undetected through obfuscation, throttled transfer rates, "blending in"

11

Fig. 1 "Hacker"

#RSAC

#RSAC
No Microsoft Windows? No problem!
 They know Linux, Solaris, AIX, etc.
 Backdoors are planted there too (e.g. LKMs)  Privileged credentials are stolen
 Systems for ATM limits and fraud detection are compromised  Perform PIN-based attacks (e.g. HSM API brute force1)
1 Webinar: "Don't be the next victim on PIN-Based attacks", Verizon Business 2009
12

Payment Processing

#RSAC

Architecture Crash Course

#RSAC
Electronic cash registers (ECRs)
 Communicate with each other on a hub using IRC (Inter-Register Communications)
 Communications device attached to one register connects over dial-up or encrypted IP direct to processor
 Not hacked remotely
14

#RSAC
Standalone terminals
 Dial-up and IP enabled  Encrypted IP connection direct to processor  Also not hacked remotely
15

Point of sale (POS)
 Many run on Windows unhardened  POS terminals (aka registers) run the POS client component  Registers communicate with a "back of house" POS server  Peripherals attach via USB or COM
 Magstripe readers (MSR)  PIN Pads  PIN Pad/magstripe reader all-in-one  MICR check readers  Barcode scanners  Receipt printers
16

#RSAC

Card Data Reading

#RSAC

Dissected

#RSAC
Demo: Magstripe

#RSAC
Peripherals: Magstripe readers (MSRs)
 Most are configured for "keyboard emulation"
 Swipe card > keyboard rapidly types magstripe data
 HID mode installs USB device with drivers and API interaction
 It's all unencrypted  Only Track2 is needed to clone magstripe cards for fraud
19

Peripherals: PIN pads
 Uses TDES algorithm and DUKPT key management for encrypting the PIN
 Example encrypted PIN block: B07F65762F0F4701  Yes, this is secure
 Decryption keys held by payment processor, not the merchant
 PCI PIN Transaction Security (PTS) approved
 Rigorous process with lots of anti-tampering requirements/testing
20

#RSAC

#RSAC
Demo: EMV Chip

Peripherals: EMV readers
 Designed to reduce card-present fraud
 Chip cannot be cloned
 EMV has "fallback mode" to support magstripe cards
 When enabled, magstripe fraud is still a problem
 Chip contains magstripe "equivalent" data unencrypted
 Different iCVV or dCVV prevents use for magstripe fraud, but the card issuer needs to implement it properly
 Card number (PAN) and expiration date are unencrypted Card-not-present fraud is viable without CVV2/CID

RAM dump during EMV chip read

#RSAC

22

Card Data Flow and

#RSAC

Common Thieving Locations

#RSAC
Card data flow

 Card data environment (CDE) is supposed to be segmented from the rest of the network  Encryption of sensitive card data is only required over untrusted networks

Merchant Card Data Environment
Back of House server in manager's office

Transmitted over private networks or encrypted over Internet

Processor Card Data Environment
PIN Decrypted

Card Networks

Card Issuing Banks

Magstripe handled in the clear by all systems
24

PIN and Magstripe handled in the clear at various points in the Card Data Environments

Service providers
 3rd parties handle sensitive card data for the merchant
 Web developers using shopping cart software  Online ordering services  Servers used by outsourced mobile applications  Value-add payment gateways
 Merchants by contract are supposed to hold 3rd parties liable
 They rarely do  When a 3rd party service provider is breached, the merchant pays  Lawsuits!
25

#RSAC

Card data thievery
 POS terminals
 Keystroke recorders, RAM scrapers
 POS back of house server
 RAM scrapers, network sniffers, database theft
 Payment processors
 RAM scrapers, network sniffers, database theft, HSM API brute force
 Web sites
 Code modification, database theft
26

#RSAC

#RSAC
Practical Advice

#RSAC
Educate small businesses and POS dealers

 Stop using remote desktop software
 Use a service like LogMeIn with two-factor auth enabled  LogMeIn supports one time PIN (OTP) via email for second factor  Use SMS email address so it only goes to a phone (e.g. 5551234567@vtext.com)
 Enable egress filtering, don't use POS systems for web/email
 Point to Point Encryption (P2PE)
 When upgrading POS hardware, use encrypting peripherals  PCI requires encrypting hardware for P2PE. Software solutions are snake oil
 Decryption should be done at the merchant's processor  Make sure keyed in card data and EMV are also encrypted

MagTek DynaPro VeriShield Total Protect

28

Organizations facing targeted breaches
 Point to Point Encryption (P2PE)  Know your network  Know your enemy's TTPs (aka Intelligence-driven defense)
 Don't underestimate their skills
 Spend more energy detecting and investigating incidents
 A seemingly innocent alert could lead you to something major (e.g. psexec)
 Get executive support to harden systems and revoke local admin rights
 Attackers steal and abuse privileged credentials  Protect and monitor their use accordingly
29

#RSAC

