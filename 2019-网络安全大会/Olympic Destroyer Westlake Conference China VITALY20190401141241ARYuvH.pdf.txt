Director of APAC Research Team, KASPERSKY LAB

Experience: · 13 years with Kaspersky Lab · 2 years with INTERPOL in Singapore

· Reverse Engineering · Digital Forensics · Computer Investigations

· APT Discovery · Investigations · Threat Intelligence Service

· Self-replicating network worm · Collects user credentials · Carries a wiper to destroy data · Disables local system from boot

· Destructive cyber-sabotage attack · No motive for cybercriminals => Nation-state? · Olympic Games infrastructure was a target · Compromise of supply chains

24 Feb

Washigton Post claimed that it was Russia that used NK false flag

Crowdstrike claimed there was no proof it's Sofacy.
IntezerLabs claimed OlympicDestroyer used code of 3 Chinese APT groups Microsoft claimed they found EternalRomance

12 Feb

Samples started circulating in the community. Cisco Talos published blog about OlympicDestroyer, connected to NotPetya/Expetr & BadRabbit

9 Feb

Official opening ceremony of Winter Olympics suffers from unknown cyberattack

7 Jan

McAfee blogs about spear phishing campaign on Olympics

· What is the infection vector? · How large was the operation? · Why cybersecurity industry was confused? · What is the true motivation of the attacker?

9 This is just a sample picture. This is not a picture of the attacked resort.

November-December 2017

Email

Enterprise Government

Hospitals

Energy

Semiconductor Hotels and

Companies

Vendor

Resorts

Media and Advertsing

Weaponized Macro Document

· The worm collects credentials and hostnames · Every new generation includes appended new hosts · It is possible to reconstruct the chain of infection

OlympicDestroyer propagation chart

· No financial motivation · Similarities to different actors · False signatures to trigger detections

Lazarus

OlympicDestroyer

NotPetya? Eternal Romance? Chinese Hackers? Lazarus?

· Unusual attribute connected OlympicDestroyer to Lazarus · This attribute, knows as Rich Header has never been used for attribution before

Olympic Destroyer

Lazarus

· Contains encrypted data · Includes references and counters to used object files · May uniquely identify the project and author · We discovered that it was FORGED in OlympicDestroyer samples.

Offset First value

00

44 61 6E 53 ("DanS")

08

00 00 00 00

10

Tool id, build version

...

...

52 69 63 68 "Rich"

Second value 00 00 00 00 00 00 00 00 Number of items
Checksum / XOR key

Description Beginning of the header Empty record Bill of materials record #1
End of the header

Raw data

Type

Count Produced by

================================================================

000C 1C7B 00000001 oldnames

1 12 build 7291

000A 1F6F 0000000B cobj

11 VC 6 (build 8047)

000E 1C83 00000005 masm613

5 MASM 6 (build 7299)

0004 1F6F 00000004 stdlibdll

4 VC 6 (build 8047)

005D 0FC3 00000007 sdk/imp

7 VC 2003 (build 4035)

0001 0000 0000004D imports

77 imports (build 0)

000B 2636 00000003 c++obj

3 VC 6 (build 9782)

1 5

Raw data

Type

Count Produced by

================================================================

000C 1C7B 00000001 oldnames

1 12 build 7291

000A 1F6F 0000000B cobj

11 VC 6 (build 8047)

000E 1C83 00000005 masm613

5 MASM 6 (build 7299)

0004 1F6F 00000004 stdlibdll

4 VC 6 (build 8047)

005D 0FC3 00000007 sdk/imp

7 VC 2003 (build 4035)

0001 0000 0000004D imports

77 imports (build 0)

000B 2636 00000003 c++obj

3 VC 6 (build 9782)

Forged Rich Header in Olympic Destroyer

Raw data

Type

Count Produced by

================================================================

009E 9D1B 00000008 masm10

8 VC 2010 (build 40219)

0093 7809 0000000B sdk/imp

11 VC 2008 (build 30729)

0001 0000 00000063 imports

99 imports (build 0)

00AA 9D1B 0000003A cobj

58 VC 2010 (build 40219)

00AB 9D1B 0000000E c++obj

14 VC 2010 (build 40219)

009D 9D1B 00000001 linker

1 157 build 40219

Original Rich Header in Olympic Destroyer

1 7

ATTRIBUTION ANALYSIS
SUSPECTED

Sofacy TTP

Powershell NordVPN Hosting for TOR-based Malware Provider Bitcoins Infrastructure

A. Demonstration of power B. Controlled-impact cyberweapon checking C. Attempt to master the art of false-flags

THANKS!


