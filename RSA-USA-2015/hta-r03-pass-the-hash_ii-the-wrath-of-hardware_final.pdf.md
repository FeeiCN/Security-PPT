SESSION ID: HTA-R03
Pass-the-Hash II: The Wrath of Hardware

Nathan Ide
Principal Software Engineering Lead Microsoft, Windows security

#RSAC

#RSAC
Pop Quiz, Hot Shot
 Which would you stop:
 Largest bank heist in history  Theft of customer PII  Politically-motivated
hacking
 Good news! You don't need to choose. All exploit AD Single Sign-On (SSO)
2

#RSAC
Single-Sign On, Explained

Alice's Desktop

2

Alice's User Session

User: Alice

Password hash: C9D...

User: Alice
1
Password: a1b2c

File Server

4

Alice's User Session

User: Alice Password hash: C9D...
3
1. Alice enters username and password 2. PC creates Alice's user session 3. PC proves knowledge of Alice's hash to Server 4. Server creates a session for Alice

3

Pass-the-Hash Technique

Carol_Tablet
User: Carol NT: 238D...

Bob_Laptop
User: Bob NT: A3D7...

Alice_PC
User: Alice NT: 4F3D...

Compromise Recon
Escalate Foothold
HR_Vids

Bob@PTHCorp.com
4

#RSAC
APT-ONE User: Bob User: Carol User: Alice

#RSAC
The Future! (if you can get there)
 New protocols learn from these attacks
 NAS, printers, software, hardware rely on NTLM & Kerberos  Security or compatibility, choose one  Unless ...
5

Bringing new security

#RSAC

promises to old protocols

6

#RSAC
Physical Token Theft
7

Digital Token Theft

Local Security Authority (LSASS)

NTLM

NTOWF: C9DF4E56A2...

Alice's Laptop

Kerberos Ticket Granting
Ticket

STSTSTieicecierckrkvrkveSveiiecTtcitecetiecervkiecte

User: Alice

"Credential footprint"

Password: a1b2c

8

#RSAC
Credential Store

#RSAC
Token Theft - Demo
9

#RSAC
Current Defenses
 Binding to devices with silos/policies
 Theft still possible on restricted machines
 Reduced credential footprint
 SSO means attacker still has something to steal
 Process/Kernel code signing
 Eliminates polymorphism, but requires A/V signatures

#RSAC
Servicing frequency & definition of "Old"

Monthly OS Patches

<3 Years Client Devices

5 Years Domain Controller

1

DC

Client

2

Server
NAS
11

>5 Years Servers LOB tools
ACLs Appliances

#RSAC
New technique

 Use hardware virtualization
 "Isolated User Mode" (IUM) provides strong isolation boundary
 Strict signing - doesn't host device drivers
 Building block for all security promises

High Level OS (HLOS)
LSASS
Hypervisor

Isolated User Mode (IUM)
LSAIso

12

#RSAC
10,000' Architecture

 Windows 10 has IUM with builtin NTLM and Kerberos support

High Level OS (HLOS)

LSASS NTLM

IUM secrets

Kerberos

Isolated User Mode (IUM)

LSAIso NTLM support
Kerberos support

Clear secrets

Hypervisor

Boot

Persistent

13

IUM login flow

LSASS NTLM
NTOWF: C9DF4E56...

IUM NTLM
NTOWF: C9DF4E56...

Kerberos
Kerb key TGT

Kerberos
Kerb key TGT key

Hypervisor

User: Alice Password: a1b2c
14

#RSAC
Domain Controller
File server
Alice's User Session

#RSAC
IUM - Demo
15

Cred Theft Law of Physics #1

 Credential theft begins with hostile administrator

LSASS NTLM
NTOWF: C9DF4E56...

 If user credential comes from keyboard, it's compromised

Kerberos
Kerb key TGT
Hypervisor

#RSAC
IUM NTLM
NTOWF: C9DF4E56...
Kerberos
Kerb key TGT key

User: Alice Password: a1b2c
16

#RSAC
Strong cred support in NTLM, Kerberos
 Symmetric secret auth used to be "good enough"  Hardware bound asymmetric auth stops phishing
 In AD since Win2000  Uses PKINIT Kerberos extension  Supports Diffie-Hellman key exchange
 But, NTLM password based protocol!
 DC sends you hash
17

IUM Smartcard integration

LSASS NTLM

IUM NTLM
NTOWF: C9DF4E56...

Kerberos
TGT

Kerberos
DH key Kerb key TGT key

Hypervisor

PKINIT request
TGT TGT key NTOWF

User: Alice PIN: 1234
18

#RSAC
Domain Controller
File server
Alice's User Session

Smartcard authentication in

#RSAC

IUM - Demo

Cred Theft Law of Physics #2
 Costs favor attacker
 Shipping is expensive  Deploying is expensive
 Devices owned by (compromised) HLOS  What forces the Smartcard to use IUM?  Need to bind user accounts to IUM!

#RSAC

LSASS NTLM NTOWF
Kerberos DH key

IUM NTLM NTOWF
Kerberos DH key

Hypervisor

User: Alice PIN: 1234

IUM Credential Binding -

#RSAC

Demo

21

#RSAC
Attacking IUM
 Extraction is not the only way to get data
 IUM is oracle
 Susceptible to sidechannel and brute force attacks
 Must restrict oracle crypto
 MS-CHAPv2, NTLMv1 blocked  Smartcards restricted to DHE exchange  New trust boundary ­ firmware, IUM, hardware

Putting it together ...
 IUM-bound machine key ...  Armors hardware-bound user key ...  Retrieves TGT and encrypted NTLM hash ...  Decrypted in IUM  NTLM SSO without extractable NTLM hash!

#RSAC
TGT TGT key NTOWF Isolated User Mode (IUM)
LSAIso

#RSAC
Apply
 Hardware-backed credential theft defenses don't require starting over
 Eliminate weak protocols ­ MSCHAPv2, NTLMv1  Migrate users to hardware credentials  Update hardware and software specs to IUM-compatible devices
 You can try demos at home with the Win10 April preview 
 Get educated on other Credential Theft mitigations
 http://www.microsoft.com/pth
24

