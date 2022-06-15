Sergey Gordeychik Denis Baranov
Gleb Gritsai

 Sergey Gordeychik
 Positive Technologies CTO, Positive Hack Days Director and Scriptwriter, WASC board member
 http://sgordey.blogspot.com, http://www.phdays.com
 Gleb Gritsai
 Principal Researcher, Network security and forensic researcher, member of PHDays Challenges team
 @repdet, http://repdet.blogspot.com
 Denis Baranov
 Head of AppSec group, researcher, member of PHDays CTF team

 Group of security researchers focused on ICS/SCADA

to save Humanity from industrial disaster and to keep Purity Of Essence

Denis Baranov

Sergey Bobrov

Artem Chaykin

Yuriy Dyachenko

Sergey Drozdov

Dmitry Efanov

Gleb Gritsai

Yuri Goltsev

Sergey Gordeychik

Roman Ilin

Vladimir Kochetkov Andrey Medov

Sergey Scherbel

Timur Yunusov

Alexander Zaitsev

Dmitry Serebryannikov

Dmitry Nagibin

 Siemens ProductCERT
 Really professional team  Quick responses  Personal contacts  Patches in 10-30 days
 You guys rock!

PLC/RTU SCADA MES ERP

BUSINESS LAYER
OPERATION AND PRODUCTION SUPERVISION
SUPERVISOR CONTROL
DIRECT CONTROL

· NO magic on network
· Standard network protocols/channel level
· NO magic on system level
· Standard OS/DBMS/APPs
· Windows/SQL for SCADA · Linux/QNX for PLC
· ICS guys don't care about IT/IS · MES reality - connect SCADA to other
networks/systems (ERP etc.)

· Ethernet · Cell (GSM, GPRS, ...) · RS-232/485 · Wi-Fi · ZigBee · Lot's of other radio and wire
· All can be sniffed thanks to community

· Modbus · DNP3 · OPC · S7
· And more and more ... · EtherCAT · FL-net · Foundation Fieldbus

· Sniffing · Spoofing/Injection · Fingerprinting/Data collection · Fuzzing · Security?! ­ OPC, DNP3

 Wireshark supports most of it  Third-party protocol dissectors for
Wireshark  Industry grade tools and their free
functions
 FTE NetDecoder
 No dissector/tool ­ No problem
 Plaintext and easy to understand protocols

 Widely available tools for Modbus packet crafting
 Other protocols only with general packet crafters (Scapy)
 More tools to come (from us ;))
 Most of protocols can be attacked by simple packet replay

 Well known ports  Modbus
 Product, Device, GW, Unit enumeration
 S7
 Product, Device, Associated devices
 OPC
 RPC/DCOM
 Modern fingerprinting add ons
 snmp, http, management ports

 Open Source ICS devices scan/fingerprint tool
 Support modbus, S7, more to come
 Software and hardware version  Device name and manufacturing  Other technical info
 Thank to Dmitry Efanov

Siemens PLC

127.0.0.1:102 S7comm (src_tsap=0x100, dst_tsap=0x102)

Module

: 6ES7 151-8AB01-0AB0 v.0.2

Basic Hardware

: 6ES7 151-8AB01-0AB0 v.0.2

Basic Firmware

:

v.3.2.6

Unknown (129)

: Boot Loader

A

Name of the PLC : SIMATIC 300(xxxxxxxxx)

Name of the module : IM151-8 PN/DP CPU

Plant identification :

Copyright

: Original Siemens Equipment

Serial number of module : S C-BOUVxxxxxxxx

Module type name : IM151-8 PN/DP CPU

Modbus device 127.0.0.1:502 Modbus/TCP
Unit ID: 0 Response error: ILLEGAL FUNCTION Device info error: ILLEGAL FUNCTION Unit ID: 255 Response error: GATEWAY TARGET DEVICE FAILED TO RESPOND Device: Lantronix I WiPo V3.2.25

 Just a network device with it's own
 OS  Network stack  Applications  ...vulnerabilities
 How to find vulnerabilities in PLC
 Nothing special  Fuzzing  Code analysis (MWSL?)  Firmware reversing

 Hardcoded SSL CA certificate (Dmitry Sklarov)
http://scadastrangelove.blogspot.com/2012/09/ all-your-plc-belong-to-us.html
 Multiply vulnerabilities in PLC S7 1200 Web interface (Dmitriy Serebryannikov, Artem Chaikin, Yury Goltsev, Timur Yunusov)
http://www.siemens.com/corporatetechnology/pool/de/forschungsfelder/siemens_security_advisory_ssa279823.pdf

· Network stack
· Connects with PLCs, etc
· OS · Database · Applications
· HMI · Web
· Tools

 Depends on OS/DBMS security
 GUI restrictions/Kiosk mode for HMI  OS network stack and API heavily used
 File shares  RPC/DCOM  Database replication
 Password authentication, ACLs/RBAC  Something else?

· Nothing special
· Windows/Linux · No Patches · Weak/Absence-of Passwords · Misconfiguration · Insecure defaults

· Insecurity configuration · Users/password · Configuration · ICS-related data

· Hardcoded accounts (fixed in SP3) · MS SQL listening network from the box*
· "Security controller" restricts to Subnet
· Two-tier architecture with Windows integrated auth and direct data access
· We don't know how to make it secure
· Database for new project created based on txt template
· Perfect place to hide*
*make a note

· Managed by UM app · Stored in dbo.PW_USER

· Administrator:ADMINISTRATOR · Avgur2 > Avgur

This is my encryptionkey

...responsible disclosure

 WinCC OS/database forensic white paper and script
 WinCC security hardening guide
 Exclusive cipher tool & msf module. We don't have yet...

 WebNavigator
 Web-based HMI  IIS/ASP.NET  ActiveX client-side
 DiagAgent
 Diagnostic and remote management application  Custom web-server
...

 Not started by default and shouldn't never be launched
 No authentication at all  XSSes  Path Traversal (arbitrary file reading)  Buffer overflow

 Web-based HMI
 XPath Injection (CVE-2012-2596)  Path Traversal (CVE-2012-2597)  XSS ~ 20 Instances (CVE-2012-2595)
 Fixed in Update 2 for WinCC V7.0 SP3
http://support.automation.siemens.com/WW/view/en/60984587

 Can help to exploit server-side vulnerabilities*  Operator's browser is proxy to SCADAnet!
?
 Anybody works with SCADA and Internet using same browser?
* http://www.slideshare.net/phdays/root-via-xss-10716726

 Lot of XSS and CSRF
 CVE-2012-3031  CVE-2012-3028
 Arbitrary file reading
 CVE-2012-3030
 SQL injection over SOAP
 CVE-2012-3032
 Username and password
 CVE-2012-3034
http://scadastrangelove.blogspot.com/2012/09/newvulnerabilities-in-siemens-simatic.html

 Username bruteforce?  Password disclosure?  Path traversal?  Arbitrary file reading?  SQL injection?  XSS?


...responsible disclosure

