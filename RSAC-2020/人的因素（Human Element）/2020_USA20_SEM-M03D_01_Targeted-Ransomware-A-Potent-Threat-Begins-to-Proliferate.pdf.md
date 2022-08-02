SESSION ID: SEM-M03D
Targeted Ransomware: A Potent Threat Begins to Proliferate

Dick O`Brien
Principal Editor Symantec (a Division of Broadcom) @dickobrien

Jon DiMaggio
Sr. Threat Intelligence Analyst Symantec (a Division of Broadcom) @cyber_dimaggio

#RSAC

#RSAC
2

Evolution of Ransomware

37% drop
on ransomware attacks: 2019

500,000

400,000

300,000

200,000

100,000

0
2017

2018

2019 (to date)

#RSAC

62% increase
in targeted ransomware attacks

300 250 200 150 100
50 0
2017

2018

2019 (to date)

3

#RSAC
Surge in targeted attacks
70

60

50

40

30

20

10

0
Jan Feb Mar Apr May Jul Aug Oct Nov Dec Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec Jan Feb Mar Apr May Jun July Augu Sept Oct Nov
2017 2017 2017 2017 202107 127017 2017 2017 2017 2017 2018 2018 2018 2018 2018 202108 120818 2018 2018 2018 2018 2018 2019 2019 2019 2019 2019220011992019 2019 2019 2019 2019

2017

2018

2019

4

#RSAC
Why the shift?
Consumers: · Less PCs, more mobile devices · Critical data backed up in the cloud · Less email, more chat
Enterprise: · Higher payouts on offer · Paying can be a business decision · Cyber insurance might cover losses
5

Breakdown of attacks

70 60 50 40 30 20 10
0
2017
2017

2018
2016

01/01/2017 01/02/2017 01/03/2017 01/04/2017 01/06/2017 01/07/2017 01/08/2017 01/10/2017 01/11/2017 01/12/2017 01/01/2018 01/02/2018 01/03/2018 01/04/2018 01/05/2018 01/06/2018 01/07/2018 01/08/2018 01/09/2018 01/10/2018 01/11/2018 01/12/2018 01/01/2019 01/02/2019 01/03/2019 01/04/2019 01/05/2019 01/06/2019 01/07/2019 01/08/2019 01/09/2019 01/10/2019 01/11/2019

6

#RSAC
Sodinokibi SamSam Ryuk Robbinhood MegaCortex Matrix GoGalocker BitPaymer
2019
2019

Where are the victims?

2,000

1,800

1,600

1,400

1,200

1,000

800

600

400

200

0

U.S. Turkey

UK

Canada India

7

#RSAC

Italy Australia Denmark China

South Korea

#RSAC
GogaLocker: New bred of threat

#RSAC
GogaLocker a Targeted Ransomware Case Study

INCURSION

INITIAL STAGE

SPEAR PHISHING
EXPLOITS
POORLY SECURED SERVICE (Incl. MSP)
DROPPER

POWERSHELL

Simple PowerShell commands used: · powershell -nop -w hidden -encodedcommand JABzAD##### · CompileAssemblyFromSource  fileless payload in memory · Using Cobalt Strike Beacon's Reflective Loader backdoor
 Using known tools for fileless payload

9

#RSAC
GogaLocker Ransomware ­ Step Two

INCURSION

INITIAL STAGE

DISCOVERY

SPEAR PHISHING
EXPLOITS
POORLY SECURED SERVICE (Incl. MSP)
DROPPER

POWERSHELL

PUTTY MIMIKATZ WOLF-X-FULL

Get credentials/passwords · Mimikatz in all variations · others use password guessing  account lockouts · or alternatives like Int-Monologue or Kerberoasting · Bloodhound Active Directory enumeration
The goal is AD/DA password  distribute malware & disable security for all devices

10

#RSAC
The Human Element The attackers learn about your environment...
... and then adapt to it on the fly. They know how to disrupt your organization the most!
11

#RSAC
GogaLocker Ransomware ­ Final Step

INCURSION

INITIAL STAGE

DISCOVERY

STEALTH &

LATERAL

COUNTERMEASURES MOVEMENT

ATTACK TRIGGERED

SPEAR PHISHING
EXPLOITS
POORLY SECURED SERVICE (Incl. MSP)
(PAID) DROPPER

PUTTY

POWERSHELL

MIMIKATZ

WOLF-X-FULL

SIGNED MALWARE
DISABLE ANTIVIRUS
CHANGE PASSWORDS

PSEXEC
WMIC
BATCH FILES

ENCRYPTION

· wmic /node:"IPADDRESS" /user:

/password:

process call create

"cmd.exe /c copy \\IPADDRESS\c$\windows\temp\kill.bat c:\windows\temp\"

· net.exe stop "BACKUP SERVICE" /y

· net.exe user

· logoff.exe <num>

12

#RSAC
Conclusion
· Targeted ransomware against organizations is increasing · Weak authentication practices foster lateral movement · Attackers might steal data and delete all your backups
13

#RSAC
Be prepared
You should already: · Back up your data (and check your restore capability) · Keep your operating system and software up to date
In the near future you should: · Be prepared for ransomware ­ conduct a drill · Check your email protection · Follow best practices & monitor dual-use tools
14

SESSION ID: SEM-M03D
Thank you for your attention !

Dick O`Brien
Principal Editor Symantec (a Division of Broadcom) @dickobrien

Jon DiMaggio
Sr. Threat Intelligence Analyst Symantec (a Division of Broadcom) @Cyber_DiMaggio

#RSAC

