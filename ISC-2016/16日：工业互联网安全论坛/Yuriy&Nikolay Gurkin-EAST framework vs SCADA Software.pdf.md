" EAST framework vs SCADA Software. ICS Attack Approaches "

Yuriy&Nikolay Gurkin

Gleg ltd
Http://Eastfw.com

contents

1. About
2. SCADA Pentesting software overview. East countries national aspect.
3. EAST framework 4 SCADA SEC -- Architecture, functionality.
4. Typical SCADA vulns illustration. WinCC, IGSS etc...
5. «0Day»for IGSS SCADA. Full pwn via xml injection.
6. «0Day»for Kingview SCADA. Relatively new vector of attack -- projects infection.

1. About

Works were headed by Gleg team. On the sec and exploit research market Gleg has been working since 2004.
Information Security Research in:

Type of Software

SCADA Medical Defence
Web

What is SCADA
SCADA Supervisory Control And Data Acquisition
SCADA
RTU HMI PLC etc.

What is SCADA

SCADA Supervisory Control And Data Acquisition
SCADA

Factory

Controllers soft

Human Machine Interface

WAeBstigOQpeunesStioounrcies p­eWntehsicthtosoelscurity

software to choose for ICS pentest

if take in account national country's

2. Pentesting

Tools

Wasepsetcptesn?t!est frameworks

Availability, Trust, Origin, Reliability
Mdoesmt knaonwdnso.pen-source & commercial PenTest
tools: Metasploit (partly open-source. US)
PCloereaImsepacht,aCvaenvaas, Rloapoidk7 tMoetoasuprloait pproach (tcooAmlltfmhroiesmrc.iUalS..A=l>l UmS)any 0-Day`s vulns and knowledge
are available FIRST for US anyhow... is this ok for East countries?

Some thoughts about common SEC software:
E.g. : For governmental structures in Russia (including learning and edu !) Bureau of Industry and Security approval is needed. => time and cost For commercial -- depends on... Delivery -- sometimes several monthes Some products are not delivered at all to some markets (e.g. Core Impact) No garantie from backdoors or «hiding» of info

So, it is good to:
Have national standards for Sec Admins, CSO, Pentesters Develope and use more national and partner countries tools and soft More info exchange, conferences, seminars etc.  Sec department for large companies or gov structures Ready for interaction with other countries. Security is international, but don't forget national interests...

Conclusions. What do we need for SCADA Security?
Trusted code ( national researchers and companies, verified code!)
Ability to study, learn, develope 24/7 for all national and partner entities
Most interesting and critical 0-day`s knowledge first for national partner and open-source frameworks...
Free development of software and tools
Equal conditions with partners in other countries
Unrestricted knowledge exchange

EAST framework for SCADA pentesting!
Spaceship East ( «Vostok») ... were made in USSR... Same like EAST framework -- for piecefull progress
Let's proceed to second part. Functionality and Arch:

3. EAST -- Exploits And Security Tools framework for SCADA pentesting
So, our approach is to use EAST for SCADA pentesting and exploits development
Let's have a look to Architecture, Functionality, Features etc.

Architecture
·Programming language - Python
·Crossplatform
·Modules interaction struct
·API
·GUI and console both remote All made SIMPLE to max extent!

Architecture
GUI
· WebSocket interaction between modules, core, webserver and webclient.
·Ability to correct modules «on the fly»
·Fast reboot, fast operation

Functionality
EAST framework allows to develope modules like tools, exploits, fuzzers, scanners and so on. Currently: ·3 types of shellcodes (message, reverse, command). ·5 types encoders. · Troyan and executables of small size. · Classes for web vulns.

Comparison
Comparison

EaST Core Canvas Metasploit

Simple to learn and use

+

-

-

-/+

Code verified (no backdoors)

100% 0% 50%

50%

Lessons and learning docs( in

+/- -

-

+

english)

Modules and packs available

-/ +

+

+

(exploits, tools etc..)

«+»

SCADA exploits illustrated with the help of EAST Framework
Log & Event Manager normalizes logs so your rules and reports work regardless of the source. For example, see all logon failures regardless of the original log structure.
Soft · Solarwinds Log and Event Manager
Type · Remote Code Execution
CVE · public
· Solarwinds Log and Event Manager XML Attack injection resulting in arbitrary code exec.

SCADA exploits illustrated with the help of EAST Framework
Solarwinds Log and Event Manager RCE. East framework module sample.

WinCC Dos with EAST Framework
SIMATIC WinCC - The scalable and open SCADA system for maximum plant transparency and productivity
Soft · Siemence WinCC
Type · Denial of Service
CVE · public
· "miniweb.exe" crash after specially Attack crafted HTTP POST query.

SCADA exploits illustrated with the help of EAST FW
WinCC DoS. East framework sample.

WinCC Directory traversal with EAST Framework
SIMATIC WinCC - The scalable and open SCADA system for maximum plant transparency and productivity
Soft · Siemence WinCC
Type · Directory traversal
CVE · public
· "miniweb.exe" is vuln to «directory Attack traversal»

SCADA exploits illustrated with the help of EAST FW
WinCC Directory Traversal. East framework exploit

5. Industrial control systems. IGSS SCADA. 0-Day.
IGSS operates in two business divisions: 1. Field Seismic Works 2. Geophysical Data Processing and Interpretation.
· IGSS SCADA
Soft
· Remote Code Execution
Type
· 0-day
CVE
· XML injection leveraged to arbitrary code execution.
Attack

SCADA exploits illustrated with the help of EAST Framework
IGSS SCADA 0day exploit. EAST framework module.

SCADA exploits illustrated with the help of EAST Framework
IGSS SCADA 0day exploit. EAST framework module.

6. KingView SCADA 0-day vulnerability
High-Performance PC Software for Building Data Information Service Platforms or SCADA Systems, comes with an hour of free web based training which can be catered around your project.
· KingView SCADA
Soft
· Arbitrary code execution via project files infection.
Type
· 0-day
CVE
· Project infection. Relatively new class of attacs to Attack SCADA systems.

«0Day» for Kingview SCADA. Project infection. .

6. KingView SCADA 0-day vulnerability
High-Performance PC Software for Building Data Information Service Platforms or SCADA Systems, comes with an hour of free web based training which can be catered around your project.
Soft · KingView SCADA ver. 7.5.1.0 (2016)
Type · Denial of Service.
CVE · 0-day
Attack · Heap OF in HistorySvr Service

SCADA security. Summary
.
 SCADA systems could suffer from different types of vulns.  Penetration testing is a necessary measure for SCADA systems protection. Help to reduce risks.  It is good to use open-source or trusted PenTest software.  Reveal vulnerabilities, discover possible attack vectors to stay protected.  Try best to provide 0Days protection.
EAST Framework is good for SCADA pentesting in East Countries !
You wish to develope? - Contact us for partnership!
WWW.EASTFW.COM From Russia with love

THANKS

THANKS

THANKS

THANKS

THANKS

