Updates and highlights from recent honeypot tools development
The Honeynet project
 Julia Yu-Chin Cheng (Julia.yc.cheng@gmail.com)

Outline
· Part 1: Basic Concept · Part 2: Updates and highlights of often-used honeypots · Part 3: Integrated Multi-Honeypot Framework

PART 1: BASIC CONCEPT

What is Honeypot ?
By Lance Spitzner 2002

What is Honeypot ? (Cont.)
`A honeypot is a resource which is expected to be attacked or compromised.`
· Goals of Honeypot :
­ Learn HOW we are being attacked ­ Learn WHO is attacking us ­ Learn WHAT the attackers try to achieve ­ Learn HOW TO DEFEND

Honeypot(s) can be very useful !

· If deployed in internal placement (behind your firewall):

­ Catch internal scanning hosts

­ Catch insider threats
· If deployed in external placement

Low-false positive
rate

­ Early warning system via threat feeds

­ Attack trends

­ Information exchange

Honeypot Components Design :

Interaction Capture / Handler Analysis

Logging

Mimic Vulnerability
Mimic Vulnerability: Used as bait to deceive or detect hackers, malware or misbehaving users Interaction handler: Handler the interaction of honeypot and attack(er). Capture/Analysis: Designed to capture/Analyze attack data.
Logging: Log attacking events.

PART 2: Updates and highlights of
often-used honeypots

Catch up the latest tool development at https://honeynet.org/blog

Often-used Tools and Honeypot

*+*#6 2GGRFH *QPG[UKPM

6JWI /KVORTQZ[

&RMV

.KDGOW Hpfeeds )NCUVQRH

%CRVWTG*2% %%#50 2KEXK\ 5WTKECVG

%QYTKG

&TQKFDQZ %WEMQQ5CPFDQZ

-KRRQ

*QGP[UVKEM

*QPG[UPCR

9QTFRQV

*(NQY

#46&TQKF 2JQPG[%

)8QN *QPG[%

#2-KPURGEVQT

*QPG[YCNN %&41/

*QPG[F

&KQPCGC

*QPG[VTCR

%QPRQV &QEMRQV

)QQING*CEM*QPG[RQV

*QPG[OQNG

0GRGPVJGU

5GDGM

2GJWPVGT

9KTGUJCTM'ZVGPVKQPU

5JKXC

9GDXK\ 0GDWNC

Dionaea and Libemu

Dionaea ­ Malware Capture Honeypot
· Server-side low interaction honeypot · Emulate remote exploitable bugs to trap malware
exploiting and ultimately obtain a copy of the malware · Emulate vulnerabilities in Windows services such as
SMB, HTTP, TFTP, FTP, mssql, mysql and sip · Libemu - Full shellcode emulation · Expandable through plugins and modules

Dionaea ­ Malware Capture Honeypot

How Dionaea traps malicious content:

Worm/Virus 1. Connect and chat with the network service
2. Reply

Dionaea
Network Service Emulation: SMB, http, ftp, tftp, MSSQL,
MySQL, SIP

3. Sending exploiting payloads
4. Shellcode Detection using
Libemu
5. Dionaea use tftp/http/ftp protocol to gather the remote malware

Exploiting Payloads Gathering (mimic vulnerability)
Exploiting Payloads Detection Using Libemu
Malware Download

6. Logging into files/DB or submit 3party

Logging and Submit

LibEmu- Emulating the x86 shellcode
· Step 1: Detect, measure and execute payloads (shellcode) sent by attackers
· Step 2: Running the shellcode in the libemu vm Executing the shellcode to record API calls and arguments
· Step 3: Take action to acquire a copy of the malware.
­ Shell Binding / Connect Back, Exec ­ Dionaea offers shell emulation for payload that offers a shell to the attacker (usually via port binding or connecting back to the attacker).
­ URLDownToFile API : Use URLDownloadToFile API call to retrieve files via HTTP and execute retrieved files afterwards.

Kippo and Cowrie

Kippo and Cowrie: SSH Honeypot
· Kippo:
­ https://github.com/desaster/kippo ­ A medium-interaction SSH honeypot written in Python ­ Emulates an OpenSSH server and shell with virtual filesystem ­ Log brute force attacks and the entire attacking shell interaction
· Cowrie:
­ http://www.micheloosterhof.com/cowrie/ ­ A full fake filesystem resembling a Debian 5.0 installation is
included. Possibility of adding fake file contents ­ SFTP and SCP support for file upload ­ Support for SSH exec commands ­ Forward SMTP connections to SMTP Honeypot (e.g. mailoney)

Cowrie Logs

Conpot

Conpot - What is SCADA System ?
Monitor, Collect, Decide
SCADA System

An introduction to SCADA

HMI (Web Interface)Work Station
ModBus TCP/IP­ DNP3 protocols communicate between SCADA server and RTU/PLC
Communication Router

Data Historian

SCADA Server

RTU/PLC

Temperature Oil
Radioactivity Pressure Alarm

RTU/PLC

Industrial Equipment

A SCADA system works by operating with signals that communicate via channels to provide the user with remote controls of any equipment.

An introduction to SCADA (Cont.)
· Five essential composing parts of a SCADA system:
­ Human Machine Interface (HMI): Each tag and sends it to a human operator
­ Supervisory system (SCADA Server): Gathers the data from each tag and sends commands or operations to the process.
­ Remote Terminal Units (RTUs): Connect sensors and convert their signals to digital data and send it to the supervisory system.
­ Programmable Logic Controllers (PLCs): Economical field devices
­ Communication infrastructures: Delivers connectivity to the supervisory system and then to the RTUs and PLCs for the user to command.

An example of SCADA Software
http://controltechme.com/en/full-tek/scada-software

SCADA Attack
https://blog.fortinet.com/2015/02/12/known-scada-attacks-over-the-years

SCADA Communication Protocol

ModBus

DNP3

Modbus is typically used for SCADA-style network communication between devices
implementations over serial, TCP/IP Standard port 502 TCP

DNP3(Distributed Network Protocol) used for communications
between master station and RTUs Port 20000 TCP/UDP

· RTU collects data from sensors and converts the readings into a protocol, such as MODBUS or DNP3, that can be transported across your communications network

Unsecure !?

Modbus

Profinet, s3/5/7

CC-Link CIP, Ethernet/IP

No authentication, No encryption, No validation

Conpot - ICS/SCADA Honeypot
· http://conpot.org/ · Trap attackers who attack SCADA system. · Low-interactive server side Industrial Control Systems
honeypot · Emulator:
­ Common industrial control protocols - complex infrastructures ­ Productive HMI's or real hardware with the complete stacks of
the protocol

Conpot ­ Testing Conpot

Glastopf and Wordpot

Glastopf ­ Web Application Honeypot
· http://glastopf.org/ · Server-side low interaction honeypot
· Glastopf operates like a normal web server but emulates often-exploited web application vulnerabilities
­ SQL Injection ­ Remote File Inclusion (RFI) ­ Local File Inclusion (LFI)
· When attacker sends HTTP request, Glastopf attempts to respond the expectations to, for example, download malicious files, system information exposure.

Glastopf ­ Web Application Honeypot
http://www.example.com/index.php?username=1'%20or%20'1'%20=%20'1&password=1'%20or%20'1'%20=%20'1 http://www.example.com/product.php?id=10 AND 1=1 http://www.example.com/product.php?id=10||UTL_INADDR.GET_HOST_NAME( (SELECT user FROM DUAL) )--

Glastopf ­ Web Application Honeypot

LFI Attack
1.Send HTTP Request: http://www.target.com/index.php? page=../../../../../var/log/auth.log

The Attacker

Vulnerable Web Server (http://www.target.com)

Glastopf ­ Web Application Honeypot
· Glastopf v3 Project Update:
­ Vulenrability Emulator concerns with what attacker expects to see when sending HTTP requests.
­ Dynamic dork list ­ Advanced SQL injection handler

Bot execute file collected from Glastopf

From Glastopf to Wordpot
· Wordpot is a Wordpress honeypot which detects probes for plugins, themes, timthumb and other common files used to fingerprint a wordpress installation.
· http://brindi.si/g/projects/wordpot.html

Thug

Drive-by-download attack

Vulnerable

Web

Server

 

  Exploit Code 


( 

Phishing Site


37

Exploit Kit (EK)

· Exploit kit (EK) ­ A server-based framework that uses exploits to take advantage of vulnerabilities in browserrelated software applications to infect a client without the user's knowledge

check if a user's computer is vulnerable and send the appropriate exploit.
"execute arbitrary code" to infect vulnerability

Adobe Flash Player, Java Runtime, Microsoft Silverlight, Web Browsers (IE)

Retrieve/Download malware designed to infect a Windows computer (an .exe or .dll file).

Reference: http://researchcenter.paloaltonetworks.com/2016/06/unit42-understanding-angler-exploit-kit-part-1-exploit-kitfundamentals/

Angler Exploit Kit + Ransomware
Compromised Legitimate website

Gate

Landing Page

Exploit
Ransomware ( TeslaCrypt)

https://blogs.sophos.com/2015/07/21/a-closer-look-at-the-angler-exploit-kit/

Angler Exploit Kit + Ransomware

Compromised Legitimate website

Compromised site has been injected pseudo-Darleech script pointing to Gate

Gate

Landing Page

Exploit
Ransomware ( TeslaCrypt)

https://blogs.sophos.com/2015/07/21/a-closer-look-at-the-angler-exploit-kit/

Angler Exploit Kit + Ransomware

Compromised Legitimate website

No-IP.com Domain or legal website has been used as a gate to check O.S. and redirect to Angler Exploit Kit Landing Page

Gate

Landing Page

Exploit
Ransomware ( TeslaCrypt)

https://blogs.sophos.com/2015/07/21/a-closer-look-at-the-angler-exploit-kit/

Angler Exploit Kit + Ransomware

Compromised Legitimate website

1. Check for security tools or virtual machine 2. Dynamically construct shellcode 3. Vulnerable application

Gate

Landing Page

Exploit
Ransomware ( TeslaCrypt)

https://blogs.sophos.com/2015/07/21/a-closer-look-at-the-angler-exploit-kit/

Angler Exploit Kit + Ransomware

Compromised Legitimate website

1. Shellcode upon exploitation of CVE-2014-6332 and Payload URL (Ransomware) and payload decryption key.
2. Load Malicious Flash Content

Gate

Landing Page

Exploit
Ransomware ( TeslaCrypt)

https://blogs.sophos.com/2015/07/21/a-closer-look-at-the-angler-exploit-kit/

Angler Exploit Kit + Ransomware
Compromised Legitimate website

Gate

Landing Page

Exploit
Ransomware ( Cryptowall)

https://blogs.sophos.com/2015/07/21/a-closer-look-at-the-angler-exploit-kit/

Thug ­ Detect malicious web content
· Thug is a client-side honeypot (honeyclient) that emulates a web browser.
· http://buffer.github.io/thug/ · Mimic the behavior of a web browser · It is designed to automatically interact with the malicious
website to explore its exploits and malicious artifacts, often in the form of JavaScript.

Thug core components
Thug emulating browser interacts with malicious website, analyzes malicious JavaScripts, detect shellcode and then download malicious files.

PART 3: Integrated MultiHoneypot Framework

The Problem

· Deploying and managing honeypots is difficult and time-consuming

­ Installing honeypot packages and dependency libraries

­ Update new version

­ Managing honeypot sensors

­ Setting up data flow

­ Uniform data formats of different honeypots

­ Data storage ­ Analyzing collected data ­ Visualization

Not Used as much as they could be in production

New Trend ! New Business !
Integrated Multi-pots Framework

Easy Deployment

Multi-pots & Tools

Centralized Management

Visualization

MHN and T-pot

Modern Honey Network (MHN)
· Open Source Honeypot Management Platform · https://github.com/threatstream/mhn · http://threatstream.github.io/mhn/ · Blog: https://blog.anomali.com/mhn-modern-honey-network
· The goal of MHN is to simplify honeypot deployment and ultimately to make these tools a mainstream, inherent part of the security arsenal for companies in various industries.

Modern Honey Network (MHN)
· Business Model is to provide an inexpensive public provider with MHM (SaaS), anyone can start experimenting with and learning from honeypots
· Leverages some existing open source tools:
­ Hpfeeds ­ Nmemosyne ­ Honeymap ­ MongoDB ­ Dionaea ­ Conpot ­ Snort
· Soon: Suricate, Kippo, others

Modern Honey Network (MHN)
· Leverages some existing open source tools:
­ Hpfeeds ­ Nmemosyne ­ Honeymap ­ MongoDB ­ Dionaea ­ Conpot ­ Snort
· Soon: Suricate, Kippo, others

MHN Architecture

Modern Honey Network (MHN)
· Honeypot Management:
­ MHN Automates management tasks ­ Easy to deploy new honeypots ­ Setting up data flows using hpfeeds ­ Store and index the resulting data ­ Correlate with IP Geo data ­ Real-time visualization

Modern Honey Network (MHN)

T-Pot: A Multi-honeypot Platform
· http://dtag-dev-sec.github.io/mediator/feature/2016/03/11/tpot-16.03.html
· T-pot is a multi-honeypot platform based on the wellestablished honeypots, IDS/IPS, ELK
· Make this technology available to everyone who is interested and release it as a Community Edition
· The data gathered by those honeypots is a core component for our Early Warning System and feeds the data for the Sicherheitstacho /Securitydashboard

T-Pot Architecture

T-pot components:
· Elasticsearch / logstash / kibana (ELK)
­ structure and vizualize data in realtime.
· Suricata
­ a Network IDS, IPS and Network Security Monitoring engine.
· Honeytrap
­ a low-interaction honeypot daemon for observing attacks against network services. aims for catching the initial exploit
· Kippo/Cowrie · Glastopf · Dionaea · Conpot · Elasticpot: Basic elasticsearch honeypot · eMobility: a high-interaction honeynet with the goal to collect
intelligence about the motives and methods of adversaries targeting next-generation transport infrastructure.

http://securitydashboard.eu/

Conclusion
· http://www.darkreading.com/vulnerabilities---threats/5-reasons-everycompany-should-have-a-honeypot/d/d-id/1140595
1. Low false positives, high success 2. Able to confuse attackers 3. Only a time sink, if you allow it 4. Help train your security team 5. Many free options

Conclusion
TRY IT NOW !

Email : Julia.yc.cheng@gmail.com Slideshare: http://www.slideshare.net/YuChinCheng

