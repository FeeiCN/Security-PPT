#RSAC

SESSION ID: HTA-R06
Deconstructive Take-Over of Mitsubishi Electric Ecosystems

Mars Cheng
Manager, PSIRT and Threat Research TXOne Networks Inc. @marscheng_

Selmon Yang
Staff Engineer TXOne Networks Inc.

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Who are we?

Mars Cheng

Manager, PSIRT and Threat Research at TXOne Networks
· ICS/SCADA, IoT, Malware Analysis and Enterprise Security · 10+ CVEs and 3 SCI Journals · Spoke at Black Hat Europe, DEF CON, HITCON, FIRST, SecTor, HITB, SINCON, ICS Cyber
Security Conference USA and Asia, CYBERSEC, InfoSec Taiwan and so on · Instructor of HITCON Training 2021/2020/2019, Ministry of Education, Ministry of
National Defense, Ministry of Economic Affairs in Taiwan, and Listed companies · General Coordinator of HITCON (Hacks In Taiwan Conference) 2022 and 2021

Staff Engineer, TXOne Networks
· IT/SCADA Protocol Parsing · Linux Kernel Programming · Honeypot Deployment & Optimization · In-depth ICS research specialist · Has spoken at CYBERSEC, HITB, and HITCON

Selmon Yang

3

#RSAC
Outline
Modern ICS/SCADA Ecosystems Overview Dissect and Compromise Mitsubishi Ecosystems A Story of Reporting the Vulnerability Apply and Closing Remarks
4

#RSAC
Modern ICS/SCADA Ecosystems Overview

#RSAC
Modern ICS/SCADA Ecosystems Overview
Market Share Mitsubishi Electric
­ Largest in Asia Pacific ­ Top 3 in Global Market
https://ipcsautomation.com/blog-post/market-share-of-different-plcs/
6

#RSAC
Modern ICS/SCADA Ecosystems Overview

Rank

PLC Manufacturers

Industrial Automation Revenue
(millions of USD)

Consolidated Revenue (millions of USD)

1

Siemens (Simatic)

$18,281

$98,636

2 Mitsubishi Electric (Melsec)

$13,346

$41,120

3

Emerson (GE Fanuc)

$12,202

$18,372

4

Hitachi

$8,654

$86,250

5

Bosch (Rexroth)

$8,523

$88,319

6

Schneider Electric (Modicon)

$7,172

$30,861

7

Eaton (Cutler-Hammer)

$7,148

$21,390

8 Rockwell Automation (Allen Bradley)

$6,694

$6,694

9

ABB (B&R Automation)

$6,273

$27,978

10

Keyence

$5,341

$5,341

PLC Manufacturers Ranked in Order of Industrial Automation Net Annual Sales Revenue

Market Share Ranking

PLC Manufacturers

PLC Brand Name/s

1

Siemens

Simatic

2

Rockwell Automation

Allen Bradley

3

Mitsubishi Electric Melsec

4

Schneider Electric

Modicon

5

Omron

Sysmac

6

Emerson Electric (GE)

RX3i & VersaMax (GE Fanuc)

7

Keyence

KV & V-8000

8

ABB (B&R Automation) AC500 X20 & X90

9

Bosch

Rexroth ICL

10

Hitachi

EH & H

Most Popular PLCs ­ Top 3 Mitsubishi Electric

7
https://ladderlogicworld.com/plc-manufacturers/

Mitsubishi Ecosystem - Scope
iQ-R iQ-F
F Q L

MELSEC iQ-R

MELSEC-F

MELSEC iQ-F

MELSEC L

MELSEC Q

System Size

https://www.mitsubishielectric.com/fa/products/cnt/plc/pmerit/index.html

#RSAC
Optimum Automation Control Area
8

#RSAC
Mitsubishi PLCs Usage

Automotive

Automated Warehouse Food and Beverage

Semiconductors

General Automation Machine Tools Flat Panel Displays (FPD)
https://www.mitsubishielectric.com/fa/products/cnt/plc/pmerit/case.html

Chemical
9

#RSAC
Reviewed Mitsubishi Vulnerabilities
Over 100 Vulnerabilities

Almost 90% Vulnerabilities are exploitable remotely

Average CVSS 7.7 (High)

Over 40% Vulnerabilities are low attack complexity
Most of the vulnerabilities appear in HMI, EWS and other software

25 % Vulnerabilities
are Critical

10

#RSAC
Modern ICS/SCADA Ecosystems Overview: Siemens

EWS

HMI

Siemens S7/S7+

Siemens S7/S7+

PLC PROFINET

Field Devices

Historian 11

#RSAC
Modern ICS/SCADA Ecosystems Overview: Mitsubishi

MELSEC-SLMP

Modbus/TCP

EWS

EtherNet/IP

HMI

MELSOFT

...

PLC CC-Link

Field Devices

Historian 12

#RSAC
Dissect and Compromise Mitsubishi Ecosystems

#RSAC
Before Dissecting
This issue is not a vulnerability in Mitsubishi Electric products from the vendor's perspective
TXOne
14

#RSAC
How to Compromise Mitsubishi Ecosystems

MELSEC-SLMP

Modbus/TCP

EWS

EhterNet/IP

HMI

MELSOFT

...

MELSOFT Attacker

PLC CC-Link

Field Devices

Historian 15

#RSAC
MELSOFT vs. SLMP

Supported PLCs
Supported Commands Communication Authentication
Attacker Impact Scope

MELSOFT

MELSEC-SLMP

All CPU and Network Modules basically

Specific PLC Series and Modules

Over 110 Control Commands

Less 40 Control Commands

EWS-PLC
Yes
Large (Program, Memroy, Process, File Operation,
Stop...)

HMI-PLC No
Limited(Start, Stop, Read/Write...)

16

#RSAC
Melsoft Authentication
Omit to establish a connection and header, focus on Authentication

EWS
1.    2.   
Reverse Engineering on GxWork2/3
3.   4.  

PLC
Send 0x5a0000ff to get Challenge Code
PLC returns the random 10 byte Challenge Code. EWS will calculate the authentication code to pass the authentication based on the 10 byte Challenge Code
EWS will generate 32 byte code and response to PLC with 0x0114 to pass the authentication

17

#RSAC
Reverse Engineering GxWork2/3
18

#RSAC
Reverse Engineering on GxWork2/3 (Cont.)
After getting the random 10 byte Challenge Code
1. _ =   __
__ = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
2. Change the Xored_buffer place
_[0] = _[7] _[1] = _[3] _[2] = _[0] _[3] = _[6] _[4] = _[5] _[5] = _[2] _[6] = _[4] _[7] = _[1] _[8] = _[4] _[9] = _[8]
19

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
After getting the random 10 byte Challenge Code
3. Convert tmp_buf to short variable
tmp_buf16[0] = *(uint16_t *)(&tmp_buf8[0]); tmp_buf16[1] = *(uint16_t *)(&tmp_buf8[2]); tmp_buf16[2] = *(uint16_t *)(&tmp_buf8[4]); tmp_buf16[3] = *(uint16_t *)(&tmp_buf8[6]); tmp_buf16[4] = *(uint16_t *)(&tmp_buf8[8]);
4. Verify PLC 10 bytes Challenge Code , Sum the tmp_buf
buf16_sum = tmp_buf16[0] + tmp_buf16[1] + tmp_buf16[2] + tmp_buf16[3]; if (tmp_buf16[4] != buf16_sum) {
return -1; }
20

Reverse Engineering on GxWork2/3 (Cont.)
After getting the random 10 byte Challenge Code
5. Retrieve 4 short variables to integer variables
tmp_buf32[0] = tmp_buf16[3] * tmp_buf16[1]; tmp_buf32[1] = tmp_buf16[3] * tmp_buf16[0]; tmp_buf32[2] = tmp_buf16[3] * tmp_buf16[2]; tmp_buf32[3] = tmp_buf16[3] * tmp_buf16[3];
Go to function sub_10062C3E

#RSAC

21

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
6. Use a pre-defined 32 byte code (generated by sub_10005cdb) to generate 32 bytes hex
uint8_t array_5cdb[32] = {
0xb0, 0x7e, 0x32, 0x90, 0xb7, 0xc9, 0xa6, 0xa7, 0xe4, 0x92, 0x8b, 0x9d, 0x7d, 0x62, 0xbb, 0x6b, 0x62, 0xdc, 0x64, 0x5d, 0xd7, 0x51, 0x68, 0xd2, 0x66, 0xf7, 0xd0, 0x2b, 0xb1, 0x1a, 0xa2, 0x9f };
7. Generate 64 bytes Output buffer
memcpy(&out_buf[0], array_5cdb, 32); memcpy(&out_buf[32], &tmp_buf32[0], 16); memcpy(&out_buf[48], &tmp_buf8[0], 10); out_buf[58] = 0x00; out_buf[59] = 0x00; out_buf[60] = 0x20; out_buf[61] = 0xf2; out_buf[62] = 0x08; out_buf[63] = 0x19;
22

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
8. Generate 64 bytes array with the value is 0x36 9. Perform exclusive-OR on the first 32 bytes and _5cdb array
memset(out_buf, 0x36, 64); for (idx = 0; idx < 32; idx++)
out_buf[idx] ^= array_5cdb[idx]; Go to function sub_10062860
23

#RSAC
Reverse Engineering GxWork2/3 (Cont.)

10. Generate a 104 byte array, and copy unk_10127E68 to the first 32 bytes
uint8_t array_62860[32] = {
0x67, 0xe6, 0x09, 0x6a, 0x85, 0xae, 0x67, 0xbb, 0x72, 0xf3, 0x6e, 0x3c, 0x3a, 0xf5, 0x4f, 0xa5, 0x7f, 0x52, 0x0e, 0x51, 0x8c, 0x68, 0x05, 0x9b, 0xab, 0xd9, 0x83, 0x1f, 0x19, 0xcd, 0xe0, 0x5b };
11. Copy 64 bytes from array_104bytes, and fill 0 in the last 8 bytes

array_62860(32bytes) array_104bytes(64 bytes) 104 Byte Array

0*8 bytes

24

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
12. Handle last 8 bytes of 104 bytes array. Set last 8 bytes as 2 integer variable, and add the value 0x40
25

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
13. Run the calculation, update the first 32 bytes of 104 bytes array
26

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
14. Execute sub_10062B7B, then update the 104 byte array based on the computed challenge code. 15. Execute sub_10062BC6, update the value in offset 0x30 is 0x80 of 104 bytes array, offset 0x60 add 1
27

Reverse Engineering GxWork2/3 (Cont.)

17. Update 104 bytes array buffer

·

From offset 0x58, set 4 bytes 0.

·

Offset 0x64 is integer variable, left shift 3 bit, and SWAP It to offest 0x5c

·

Offset 0x50 add 0x8

#RSAC

16. Update 104 bytes array buffer, from offset 0x31, set 27 bytes 0, offset 0x60 add 0x27

28

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
18. Update 104 bytes array to 136 bytes
· First 32 bytes as 8 integer variable, add 32 bytes (8 integer variable) on offset 0x0104, and SWAP it.
· 104+32=136 bytes
29

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
19. From offset 0x136, set 0x5c bytes value as 0x40. Byte Array is 200 byte now 20. Exclusive-OR the last 32 bytes in the 200 byte array with Output(first 32 bytes of 64 bytes), and store to 200 byte array Repeat the same function behavior based on 200 bytes.
30

#RSAC
Reverse Engineering GxWork2/3 (Cont.)
After getting the final 200 bytes, the first 32 byte is the MS authentication function needs.
31

#RSAC
Reverse EngineerTinAgKE IT OVER!N! etwAnoarklyTsirsaffic
32

#RSAC
Making a Protocol Analysis Tool
We built a Wireshark Lua Plugin for the MELSOFT Protocol
­ Wireshark ­ Lua Plugin
33

#RSAC
Handshake Overview ­ Overwriting the PLC Program

Fake EWS
1.    2.    3.   4.   5.   6.   7.   8.  

PLC Send 0x5a0000ff to get Challenge Code PLC returns the 10-byte Challenge Code Overwrite PLC Program - 0x0114 to pass the Authentication
Overwrite PLC Program - 0x1002 Remote STOP
Overwrite PLC Program - 0x1827 MC Open File

34

#RSAC
Handshake Overview ­ Overwriting the PLC Program

Fake EWS
9.   10.   11.   12.   13.   14.   15.   16.  

PLC Overwrite PLC Program ­ 0x1811 MC Search Directory/File Overwrite PLC Program ­ 0x1810 MC Read Directory/File Overwrite PLC Program ­ 0x1829 MC Write to File Overwrite PLC Program ­ 0x182C Update File Size

35

#RSAC
Handshake Overview ­ Overwriting the PLC Program

Fake EWS
17.   18.   19.   20.   21.   22.   23.   24.  

PLC Overwrite PLC Program ­ 0x1826 MC Modify File Creation Date and Time Overwrite PLC Program ­ 0x1837 Close File Overwrite PLC Program ­ 0x1836 Write File Modifications to Storage Overwrite PLC Program ­ 0x1001 MC Remote Run
36

Handshake Overview ­ Overwriting the PLC Program

Fake EWS

PLC

1.   

2.   

3.  

4.  

5.  

6.  

7.  

8.  

OOOvvveeerrrwwwrrritiitteeePPPLLLCCCPPPrrrooogggrrraaammm PSeLCnRRRdreees0sstp0pxpuxo5oor0nann1s0ss1ee0et040h0wwxwx0et1i1iofitt0t1f8hhhp00t2Eoa2EE7brsrrgRryrsMroeoteotertrCmhrsCCeCOoCohooAtphdadeduealeelStnellh0T0e0nFxeOxnxgi0n00lePge00t0eiC00c0C0oa00otdideoen

#RSAC
37

Handshake Overview ­ Overwriting the PLC Program

Fake EWS

PLC

9.  

10.  

11.  

12.  

13.  

14.  

15.  

16.  

OOOvvveeerrrwwwrrriiittteee PPPLLLCCC PPPrrrooogggrrraaammm RRReeesssppp0oo0oxnnxn10ss18seex08e11x1ww1w810ii2M8itttMhh92hCCCMEEESrrUrRrrCeroopeaoWrrdarcdCCarChtooiDoteddDediFreeieteriole00ce0cxxtFxotS00i0olir00ez0rye00y0/-00/IF0IFiliele

#RSAC
38

#RSAC
Handshake Overview ­ Overwriting the PLC Program

Fake EWS

PLC

17.  

18.  

19.  

20.  

21.  

22.  

23.  

24.  

OOOvveveerrwrwwrrirtiietteePPPLLCLCCPPPrroroogggrarraammm 0x01RxRR81eee28sss6p3ppo6oMonnnWCsss0eereMxiwtw1weo0ii0itdtFt0hhxhii1fl1eEyEE8MrrrMF3rrrioCo7oloerrrRCdCCCCelioforomiesdcddeaaoeeettFii0e0o0oixlxnxneR000suD000nt00a0o0t00eStaonrdagTeime
39

Demo

#RSAC
40

#RSAC
From Workstation Side

Before Overwriting the PLC program

After Overwriting the PLC program
41

#RSAC
The Potential Impact of Attacks Using the MELSOFT Protocol

Series Type Module
Impact by Melsoft
Impact by Melsec (SLMP)

iQ-R Series

Module Based

CPU Module
*Yes (EWS-PLC)

Ethernet Module
*Yes (EWS-PLC)

Yes

Yes

(HMI-PLC) (HMI-PLC)

Q Series

Module Based

CPU Module
Yes (EWS-PLC)

Ethernet Module
Yes (EWS-PLC)

**Yes

Yes

(HMI-PLC) (EWS-PLC)

iQ-F

Module Based

CPU Module
*Yes (EWS-PLC)

Ethernet Module
*Yes (EWS-PLC)

Yes

Yes

(HMI-PLC) (HMI-PLC)

L Series

F Series

Module Based (without Ethernet
Module)
CPU Module
Yes (EWS-PLC)

Module Based

CPU Module
Yes (EWS-PLC)

Ethernet Module
Yes (EWS-PLC)

N/A

N/A

N/A

* Without MELSOFT Authentication, we can take over the device directly ** Can't use file-related commands

42

#RSAC
Potential Impact of Attacks Using the MELSOFT Protocol (Cont.)
Remote Run/Stop to Interrupt the Process Overwrite PLC Program to Change the Completed Control Process Read/Write the Data to Change the Small Part Control Process Malicious Files in the PLC ...
43

#RSAC
MITRE ATT&CK® Matrix for Industrial Control Systems

Initial Access

Execution

Persistence

Privilege Escalation

Evasion

Discovery

Lateral Movement

Collection

Command and Inhibit Response Impair Process

Control

Function

Control

Impact

Drive-by Compromise

Change Operating Mode

Modify Program

Exploitation for Privilege Escalation

Change Operating Mode

Network Connection Enumeration

Default Credentials Automated Collection Commonly Used Port

Activate Firmware Update Mode

Brute Force I/O Damage to Property

Exploit Public-Facing Application

Command-Line Interface

Module Firmware

Hooking

Exploitation for Evasion

Network Sniffing

Exploitation of Remote Services

Data from Information Repositories

Connection Proxy

Alarm Suppression Modify Parameter Denial of Control

Exploitation of Remote Services

Execution through API Project File Infection

Indicator Removal on Host

Remote System Discovery

Lateral Tool Transfer

Detect Operating Mode

Standard Application Layer Protocol

Block Command Message

Module Firmware

Denial of View

External Remote Services
Internet Accessible Device
Remote Services
Replication Through Removable Media
Rogue Master

Graphical User Interface
Hooking
Modify Controller Tasking
Native API
Scripting

Spearphishing Attachment
Supply Chain Compromise
Transient Cyber Asset

User Execution

System Firmware Valid Accounts

Wireless Compromise

Masquerading

Remote System Information Discovery

Program Download

I/O Image

Rootkit

Wireless Sniffing

Remote Services

Man in the Middle

Spoof Reporting Message

Valid Accounts

Monitor Process State
Point & Tag Identification Program Upload

Screen Capture

Wireless Sniffing

Block Reporting Message
Block Serial COM
Data Destruction

Spoof Reporting Message

Loss of Availability

Unauthorized Command Message

Loss of Control

Loss of Productivity and Revenue

Denial of Service
Device Restart/Shutdown

Loss of Protection Loss of Safety

Manipulate I/O Image

Loss of View

Modify Alarm Settings Rootkit
Service Stop

Manipulation of Control
Manipulation of View
Theft of Operational Information

Drive-by Compromise

System Firmware

44

#RSAC
Take-over The ICS Environment
Smart Factory
45

#RSAC
A Story of Reporting the Vulnerability

#RSAC
Timeline of Reporting the Vulnerability

[June 1, 2020] Our 1st Reply [June 1, 2020] Our 2nd Reply

[June 19, 2020] Our 3rd Reply

May

June

July

[May 30, 2020] 1st Vendor Reply

[July 8, 2020] 3rd Vendor Reply

[June 13, 2020] 2nd Vendor Reply

[July 15, 2020] 4th Vendor Reply

47

#RSAC
Vendor Perspective vs. Security Researcher Perspective

Vendor

TXOne

The authentication is not to protect the customer's security, but to prevent connection to devices of other companies

The bypass of this authentication process still will lead to an attacker can fake EWS and send any unauthenticated command to PLC

Now, without bypassing this authentication process, data in Mitsubishi PLC can also be operated by other companies' equipment by using the public protocol (SLMP)

Tweaks to remove two-way verification make products less secure, but SLMP can use less control commands than MELSOFT

Add a comment to the information submitted to the conference that this issue is not a vulnerability in Mitsubishi Electric products

We totally disagree that this is not a weakness of Mitsubishi Electric products, but...with respect

48

#RSAC
Apply and Closing Remarks

#RSAC
Immediate Actions
Quickly assess affected areas and equipment. No visibility in most OT environments
­ Deploy IDS or other network traffic analyzer
A Lua plugin for analyzing the MELSOFT protocol Snort rules for detecting and protecting MELSOFT traffic
· alert tcp any any -> any 5007 (msg: "Melsoft 0x0114 MS Authentication"; flow:to_server,established; content:"|57 00|"; offset:0; depth:2; content:"|01 14|"; distance:31; within:2; classtype:others; sid:202107011; rev:1;)
· alert tcp any any -> any 5007 (msg: "Melsoft 0x1002 MC Remote STOP"; flow:to_server,established; content:"|57 00|"; offset:0; depth:2; content:"|10 02|"; distance:31; within:2; classtype:others; sid:202107012; rev:1;)
· alert tcp any any -> any 5007 (msg: "Melsoft 0x1001 MC Remote Run"; flow:to_server,established; content:"|57 00|"; offset:0; depth:2; content:"|10 01|"; distance:31; within:2; classtype:others; sid:202107013; rev:1;)
· alert tcp any any -> any 5007 (msg: "Melsoft 0x1829 MC Write to File"; flow:to_server,established; content:"|57 00|"; offset:0; depth:2; content:"|18 29|"; distance:31; within:2; classtype:others; sid:202107014; rev:1; )
50

#RSAC
Within 3 Months Actions
Improvement measures
­ Planning a blueprint for a production line-centric zero trust architecture ­ Implement OT zero trust on your OT environment
Compromise measures
­ Build safeguards in front of critical assets ­ Deploy industrial control detection mechanism (Such as Snort) in front of
Core and Edge Switch
51

#RSAC
The Best Pratices for ICS/OT Cyberseuicty OT Zero Trust
The least privilege methodology in network, assets, protocols and suppliers

Network Segmentation

Virtual Patch

Trust List

Hardening Critical Assets

Supply Chain Inspection

Risk mitigation and malware
containment

Shield vulnerable assets and detect lateral movement

Unknown attack prevention

Keep the missioncritical assets operational

Auditing and inbound/outbound
inspection

52

#RSAC
Keep the Operation Securely Running

SESSION ID: HTA-R06
Thanks for Listening

Mars Cheng
Manager, PSIRT and Threat Research TXOne Networks Inc. @marscheng_

Selmon Yang
Staff Engineer TXOne Networks Inc.

#RSAC

