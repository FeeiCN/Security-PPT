SESSION ID: SBX1-W09
ICS Threats. A Kaspersky Lab view, predictions and reality
#RSAC

Andrey Nikishin
Special Projects Director Kaspersky Lab @andreynikishin

#RSAC
Type of incidents
Accidental infection by (traditional) malware Insiders' actions Targeted attacks (including APT)

#RSAC
Energetic Bear / Crouching Yeti

#RSAC
Energetic Bear / Crouching Yeti
APT campaign since 2010, 2800+ victims world wide Energy sector, manufacturing, pharmaceutical Spreading via
Emails with exploit Infected legitimate web sites (watering hole) Infected (repacked) legitimate installation packages Compromised Legitimate web sites as Control centres Contains a number of different trojans, backdoors and exploit packs

#RSAC
Energetic Bear / Crouching Yeti
Infected (repacked) legitimate installation packages hosted on vendors' web and FTP sites :
"eWon" ­ Belgium Developer of SCADA software and network equipment "MB Connect Line GmbH" ­ PLC remote control software developer "MESA Imaging AG" ­ super speed 3D cameras and sensors manufacturer (Switzerland)

#RSAC
Energetic Bear / Crouching Yeti
Watering hole web recourses: gse.com.ge - Georgian State Electrosystem gamyba.le.lt - Lithuania`s largest electricity generating company chariotoilandgas.com - Chariot Oil and Gas Ltd longreachoilandgas.com - Longreach Oil & Gas Ltd vitogaz.com - French-based gas distributor, supplier and technical developer

#RSAC
Energetic Bear / Crouching Yeti
List of ports used by Havex in order to discover OPC : 502 - Modbus 102 - Siemens PLC 11234 - Measuresoft ScadaPro 12401 - 7-Technologies IGSS SCADA 44818 - Rockwell Rslinx / FactoryTalk

#RSAC

#RSAC
US ICS-CERT report (ICSA-14-178-01) :
In particular, the payload gathers server information that includes CLSID, server name, Program ID, OPC version, vendor information, running state, group count, and server bandwidth. In addition to more generic OPC server information, the Havex payload also has the capability of enumerating OPC tags.
ICS-CERT testing has determined that the Havex payload has caused multiple common OPC platforms to intermittently crash. This could cause a denial of service effect on applications reliant on OPC communications.
== ping of death

#RSAC
Miancha

#RSAC
Miancha
On 2nd January 2014 Monju Nuclear Power Plant sys admin discovered multiple connections to one of the 8 PCs in nuclear reactor control centre
Reason ­ malicious update for GOM Media Player was installed 5 days before.
There were 42,000+ emails and documents on the compromised PC. Some of them were stolen by criminals

#RSAC
Problem of detection

#RSAC
Problem of detection
Lack of or complete miss of network monitoring Lack of or complete miss of experience dealing with malware
"Computer virus" as ultimate reason for all issues or malfunction It's difficult to detect unknown malware without 3rd party experts It's easier to reinstall then find out the reason of a problem SCADA Files don't have digital signature

#RSAC
BlackEnergy 2

#RSAC
BlackEnergy 2

#RSAC
Evolution of BlackEnergy
In 2013, BlackEnergy attackers began deploying SCADA-related plugins to victims in the ICS and energy sectors around the World
In the past BlackEnergy, focusing on their destructive payloads, Siemens equipment exploitation and router attack plugins
Since middle of 2014, one of the preferred attack vectors for BlackEnergy in Ukraine has been Excel documents with macros.
Works on 32-bit and 64-bit systems without problems

#RSAC
Windows plugins

fs ps ss vsnet rd scan jn cert grc sn usb dstr

File search, network and system Password collector (stealer) Screenshot maker Network spreading via RDP Remote desktop Port Scan File infector Digital certificate stealer Backup communication channel via plus.google.com Network traffic credential (login:password )extractor USB drives information collector destroys hard disk by overwriting with random data

#RSAC

#RSAC
CnC Server
<plugins> <plugin> <name>plugin_win</name> <version>3</version> </plugin> <plugin> <name>plugin_mps</name> <version>1</version> </plugin> </plugins>

#RSAC
How often do you update network routers' firmware?

#RSAC
End point protection is not enough!

Attack on Ukrainian State

#RSAC

Railway

May 2014: massive spear-phishing attack hit Ukrainian State Railway
Phishing email contained EXE file with MS Office Word icon
Malware was detected in some organizations, but not everywhere
This stage was intended to collect information about the infected orgs

Source: cys-centrum.com

#RSAC
2014 Spear-phishing email
Infected attachment contained zip archive with exe file inside

#RSAC
BlackEnergy on Ukraine in 2015
March 2015 ­ attack against Power Grid
BE attack Ukrainian Library system, some Power grid on West of the country
Oct 2015 ­ attack against UKR Election systems, TV and Media companies
Likely, the infection persisted on that systems from March 2015
Malware destroyed video project files, OS system files 23 Dec 2015 ­ massive attack against Ukrainian Power Grid
Thousands of power substations were shutdown for up to 8 hours on West and Central Ukraine. No SCADA until January 09 2016
TV and Media companies were also under heavy attacks
Source: cys-centrum.com

#RSAC
Dec 2015 attack to Ukrainian Power Grid
BE2 used as penetration method to network using Sphere phishing via PE and PowerPoint exploit Hackers disabled operation remote control and switched power off Substation control was switched to manual for weeks. 80,000 consumers were w/o energy for at least 6 hours No SCADA control until January 9 2016 or even later
Source: cys-centrum.com

#RSAC
BlackEnergy on Ukraine in 2016
Jan 2016 ­ attack against Kiev airport (Borispol)
Few computers were infected. No further destructive actions were reported
19-20 Jan 2016 ­ new Spear-phishing attack against ~100 Energy sector organizations
email attachment contained infected Ocenka.XLS macros with root.exe Gcat instead of BE, that is backdoor written on Python.
Source: cys-centrum.com

#RSAC
BlackEnergy on Ukraine in 2016
Jan 19: Continues attacks to Power Grid 100 of energy sector organizations received spear-phishing email. Email text says UKRENERGO requires new process Infected attachment included backdoor written on Python. The remote control was done via Gmail account
Infected attachment Ocenka.xls ­ infected XLS macros which downloads root.exe from CC server
Source: cys-centrum.com

#RSAC
BlackEnergy on Ukraine in 2016
Jan 20: Infection getting deeper About 9 workers from 4 Energy organizations downloaded backdoor components to their infected systems
Source: cys-centrum.com

#RSAC
Other APT's victims
Equation (targeted world-wide) National nuclear centre Railways / metro development company Aerospace and automotive supplier National airport(s) Plasma research organisation National oil company National engineering & scientific commission National space agencies & centres Power Generation Transmission & Distribution Management Company

#RSAC
Other APT's victims
Desert Falcons (targeted middle east region) National smart grid provider
FlowerShop (targeted middle east region) (public report hasn't published yet)
Power distribution company Power plant Company National Disaster Mitigation Management Org

#RSAC
Duqu 2.0

#RSAC
US public utility company case

#RSAC
US public utility company case
US ICS-CERT Monitor Q1 2014:
A major US public utility was compromised by a brute-force attack that managed to bypass security settings and infiltrate systems.
software used to administer the control system assets was accessible via internet-facing hosts.
The systems were configured with a remote access capability, utilising a simple password mechanism; however, the authentication method was susceptible to compromise via standard brute-force techniques.

#RSAC

#RSAC

#RSAC

#RSAC
Windows XP

#RSAC

#RSAC

#RSAC
Social Networks

#RSAC

#RSAC
Case. Hack of an Oil company in middle east
Fact:
Industrial network Infiltration
How:
Social Engineering, malware and compromise of Night shift engineer's PC
Consequences:
3 days of delay

#RSAC
Case. Hack of an Oil company in middle east

AttNaigchtkshsifct eopneraatroiro
was found in Facebook by hacker

Hacker downloaded SAM database and got a password from
engineering PC

Hacker has created a friendship with the
operator

Operator clicked it and got infected

Hacker was finding operators' personal data and facts from
his life

Hacker sent a URL directed to a
malware (using social engineering)

Hacker modified SCADA project
Remotely located plant/rig lost its
ability to be controlled remotely
Delay in production for 3 days

#RSAC
Summary
There are more cyber incidents then we aware of (or even think) Almost all APTs know and able to work on industrial objects Most developed APTs are able to jump over air gap (Turla, MiniDuke, RedOctober, Fanny...) End point protection is not enough! (but it has to be in place)

SESSION ID: SBX1-W09
ICS Threats. A Kaspersky Lab view, predictions and reality
#RSAC

Andrey Nikishin
Special Projects Director Kaspersky Lab @andreynikishin

