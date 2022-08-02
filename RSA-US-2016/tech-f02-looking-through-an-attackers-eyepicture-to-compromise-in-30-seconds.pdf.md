SESSION ID: TECH-F02
Looking Through an Attacker's Eye--Picture to Compromise in 30 Seconds
#RSAC

Johnny Deutsch
Senior Manager EY
Yothin Rodanant
Manager EY

Agenda for today
Who's talking here? Why is this an interesting subject? Story time (case study)

#RSAC
VoIP bridges as a target Attack phases Demo How can we improve?

2

#RSAC
Who's talking here?

Johnny Deutsch
Ex-officer in the Israeli Intelligence Corps
Deputy Chief Information Security Officer for MI unit
Manager of EY's Cyber Services in EY Israel (Hacktics ASC)
Senior Manager at EY US Advanced Security Center
Spoke at: Troopers (Germany), DeepINTEL (Austria), GrrCON (Michigan, USA), ToorCon (California, USA), DeepSEC (Austria)

Pipe (Yothin) Rodanant
Previously worked at another Big Four firm in Thailand
Master of Science in Security Informatics (MSSI) at Johns Hopkins University Information Security Institute (JHUISI)
Manager at EY US Advanced Security Center
Spent 172 nights in hotels last year
Eight years of penetration testing experience

3

#RSAC
Why is this an interesting subject?
Yes, we are talking about a specific attack vector, BUT... Shadow IT/unmanaged equipment/"Not under our control ..." A risk is a risk: it doesn't know that no one is managing it
4

#RSAC
Story time
Once upon a time, there was a client ...
Medium size company Good endpoint visibility Some network visibility Outstanding server monitoring But we only know what we know. It's the unknowns that provide us with pain ... (in comes Pipe)
5

#RSAC
Story time continues
This was your (semi) standard external penetration test But the client had secured all of the external interfaces And no social engineering was allowed Lateral thinking was required
6

#RSAC
Story time continues
Enters the guest network And the conference bridge, with dual-homed connection Did we get lucky? YES! But "now what?" you ask
7

#RSAC
VoIP bridges as a target
High success rate of compromising devices (default credentials, outdated firmware versions with known vulnerabilities, remotely exploitable) -- unmanaged and unmonitored Can be leveraged to get into internal network Boardroom and conference room spying Persistent shell access Stealthy approach and most likely being IGNORED
8

VoIP bridges as a target

#RSAC

Market share

CVE-2011-0354 CVE-2012-4970 CVE-2015-8703 CVE-2009-4196 CVE-2007-3319 Other

9

VoIP bridges as a target

#RSAC

What devices are we talking about?

Our main target today will be the vendor known as: CVE-2012-4970

10

VoIP bridges as a target

#RSAC

How many VTC devices are sitting on the internet?

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

11

Attack phases

#RSAC

Endpoint web management interface

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

12

Attack phases

#RSAC

Collection of known public exploits

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

Telnet authorization bypass (OSVDB-ID: 90195)
Heartbleed vulnerability (CVE-2014-0160)
Multiple vulnerabilities related to password disclosure of admiAnctions accounts, arbitrary file disclosure, plaintext password stored in log files, arbitrary file upload, sudo misconfiguration, etc. (CVE2015-4681, CVE-2015-4682, CVE-2015-4683, CVE-2015-4684, CVE-2015-4685)
13

Attack phases

#RSAC

Development vs. production mode

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

14

Attack phases

#RSAC

Telenet authorization bypass

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

15

Attack phases

#RSAC

Root-level access with no password

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

16

Attack phases

#RSAC

Learning the environment

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

17

Attack phases

#RSAC

Pillaging cached and stored credentials

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

Configuration
Web admin account password

Videoconference 1
/opt/<vendor name> /dat/historyremotepassword.dat

SIP, H.323 account password /opt/<vendor name>/dat/

Call detailed record(CDR)

/opt/<vendor name>/cdr/localcdr.csv

Videoconference 2
/config/userdb /mnt/base/active/config.db /mnt/base/active/call_log.db

18

Attack phases

#RSAC

Password disclosure directory traversal

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

19

Attack phases

#RSAC

But wait, there is more!

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

20

Attack phases

#RSAC

Now, for the second player of the game

Often misconfigured with default password
Heartbleed is here to stay

21

Attack phases

#RSAC

Heartbleed = free credentials

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

22

Attack phases

#RSAC

Endpoint web admin console access

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

23

Attack phases

#RSAC

Gateway admin console access

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

24

Attack phases

#RSAC

Got shells! Now what?

Compromise nearby hosts and lateral movement How do we compile tools for embedded platforms (ARM & PowerPC) in under 20 minutes? QEMU + Outdated Linux VM (e.g., Debian Squeeze) + PyRun NBNS & LLMNR to grab more credentials

10010001011 01011100101 00110101100
25

Attack phases

#RSAC

Setting up your development environment

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

26

Attack phases
Setting up your development environment (continued)

Recon Weaponize

Delivery

Exploitation Installation

C&C

#RSAC
Actions

qemu-system-arm ­M versatilepb ­kernel vmlinuz-2.6.32-5versatile ­initrd initrd.img-2.6.32-5-versatile ­hda debain_squeeze_armel_standard.qcow2 ­append "root=/dev/sda1"

27

Attack phases

#RSAC

Running Python with a single file

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

28

Attack phases

#RSAC

Dealing with different versions of GLIBC

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

GLIBC is backward-compatible, not forward-compatible
Set LD_LIBRARY_PATH
LD_LIBRARY_PATH=/lib:. ./pyrun2.7 ./Responder.py -i 192.168.2.99 ­ wrf

29

Attack phases
Obtained clear-text and password hashes from name resolution spoofing attacks

Recon Weaponize

Delivery

Exploitation Installation

C&C

#RSAC
Actions

30

#RSAC
Demo time

Recon Weaponize

Delivery

Exploitation Installation

C&C

Actions

Demo

31

#RSAC
Scenario
32

How can we improve?

#RSAC

Start from here

Don't put them on the internet Restrict access to administrative interfaces Change default password Patch management Network segregation

33

How can we improve?

#RSAC

Move onto here

Map the network for unmanaged equipment
Where do you use a third party to manage your "unknowns"? Have a brainstorming session with your team; get them to open this up for discussion
Create a map of the unmonitored assets and perform threat modeling on them
Ask for intelligence on all of the IT assets you have, not only the ones you manage

34

How can we improve?

#RSAC

Your homework from here

Next week, you should:
Identify network-accessible embedded system assets within your organization
In the first three months following this presentation, you should:
Understand who is accessing the assets, from where and why Define appropriate controls and policy for safeguarding embedded systems Integrate embedded devices into vulnerability management program
Within six months, you should:
Periodically evaluate program effectiveness

35

#RSAC
Questions?
johnny.deutsch1@ey.com & pipe.rodanant@ey.com

#RSAC
EY | Assurance | Tax | Transactions | Advisory About EY EY is a global leader in assurance, tax, transaction and advisory services. The insights and quality services we deliver help build trust and confidence in the capital markets and in economies the world over. We develop outstanding leaders who team to deliver on our promises to all of our stakeholders. In so doing, we play a critical role in building a better working world for our people, for our clients and for our communities. EY refers to the global organization, and may refer to one or more, of the member firms of Ernst & Young Global Limited, each of which is a separate legal entity. Ernst & Young Global Limited, a UK company limited by guarantee, does not provide services to clients. For more information about our organization, please visit ey.com. Ernst & Young LLP is a client-serving member firm of Ernst & Young Global Limited operating in the US.
© 2016 Ernst & Young LLP All Rights Reserved.
This material has been prepared for general informational purposes only and is not intended to be relied upon as accounting, tax, or other professional advice. Please refer to your advisors for specific advice.
37

