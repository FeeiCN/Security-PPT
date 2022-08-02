Internet-facing PLCs - A New Back Orifice
Johannes Klick, Stephan Lau, Daniel Marzin, Jan-Ole Malchow, Prof. Volker Roth
AG Sichere Identit¨at Fachbereich Mathematik und Informatik Freie Universit¨at Berlin www.scadacs.org
SCADACS

Opening
SCADACS

Talk Bytes
 Understand the workflow of a PLC.  Basic PLC programming knowlegde  Download / Upload PLC code  Inject own code with PLCinject  Compromise a production network via one internet facing
PLC
 PLC SNMP Scanner in STL  PLC SOCKS Proxy in STL
SCADACS

Volker Roth Daniel Marzin Stephan Lau Marvin

Jan-Ole Malchow Sascha Zinke Stephan Arndt Jacob Bode

Johannes Klick Mateusz Khalil Mathias Sekul Marvin2

https://www.scadacs.org

SCADACS

PLC availability and vulnerability
SCADACS

ICS Distribution - Europe

Vulnerable ICS distribution - Europe

ICS distribution - USA

Statistics
Categorys
BMS PLCND PDU PLC SCADA HMI ERP TM UPS

Devices CVEs/Exploits

31.411

9%

23.873

14%

10.381

0%

7.254

26%

2.254

28%

1.741

41%

1.400

0%

788

0%

167

0%

SCADACS

Internet-facing PLCs
 What is behind an Internet facing PLC?  Are there more indirect internet facing PLCs?  May be a whole production network?
SCADACS

Traditional attack vectors of PLCs
SCADACS

Traditional attack vectors of PLCs
Stuxnet  Compromising an off-line site through the suply chain  Compromised Siemens IDE downloaded malicous code to the PLC.
German steelwork  Compromising an on-line site through the business IT  Manipulation of the steel works control system damaged the furnace
SCADACS

What we are talking about?
SCADACS

Introduction to Siemens PLCs
SCADACS

Introduction to Siemens PLCs
1. Architecture and execution model 2. Program structure and organization 3. Cyclic execution model, I/O 4. STL programs and their MC7 representation
SCADACS

Program structure
Introduction to Siemens PLCsProgram structure and organization
 Organization Block (OB)  Data Block (DB)  Function Call (FC)  Function Blocks (FB)  System Function (SFC)  System Data Block (SDB)  System Function Block (SFB)
SCADACS



7KH&38SURFHVVHVWKHXVHUSURJUDPLQWLPHVKDUHVDQGH[HFXWHVSURJUDPLQVWUXFWLRQ

Introduction to Siemens PLCs 

$WWKHHQGRIDF\FOHWKHRSHUDWLQJV\VWHPH[HFXWHVTXHXHGWDVNVIRUH[DPSOHORDGLQ

DQGGHOHWLQJEORFNV

Cyclic execution7mKHo&d3e8l,WIK/HOQUHWXUQVWRWKHVWDUWRIWKHF\FOHDQGUHVWDUWVF\FOHWLPHPRQLWRULQJ

Cycle time

2 Time slices (1 ms each)
3
4
5
Time slice (1 ms)

SCADACS

Programming Siemens PLC in STL
Mathematical term:  Q0.0 = (I0.0  I0.1)  I0.2
Statement List (STL):
SCADACS

STL programs and their MC7 representation

Description

Bytes Offset

Block signature

2

0

Block version

1

2

Block attribute

1

3

Block language

1

4

Block type

1

5

Block number

2

6

Block length

4

8

Block password

4

12

Block last modified date

6

16

Block interface last modified date 6

22

Block interface length

2

28

Block Segment table length

2

30

Block local data length

2

32

Block data length

2

34

Data (MC 7 / DB)

x

36

Block signature

1 36+x

STL programs and their MC7 representation

OB 1 with

A %I0.0 A %I0.1 O %I0.2 = %Q0.0
is compiled to

00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

pp.........t.... ..'5-...c.!..... ............e... ................ ......... ...... ................ ................ ....

STL programs and their MC7 representation
Signature
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Version
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Attribute
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Language
STL 01, LAD 02, FBD 03, SCL 04, DB 05, GRAPH 06, SDB 07
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Type
OB 08, DB 0A, SDB 0B, FC 0C, SFC 0D, FB 0E, SFB 0F
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Number
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Length
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Password
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Last modified date
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Last modified date
44771125 milliseconds and 11523 days since 1/1/84 = 7/20/15 12:26:11.125 pm
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Interface last modified date
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Interface length
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Segment table length
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Local data length
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Data/Code length
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Opcodes
A %I0.0 A %I0.1 O %I0.2 = %Q0.0
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Opcodes
A %I0.0 A %I0.1 O %I0.2 = %Q0.0
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Opcodes
A %I0.0 A %I0.1 O %I0.2 = %Q0.0
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Opcodes
A %I0.0 A %I0.1 O %I0.2 = %Q0.0
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

STL programs and their MC7 representation
Opcodes
A %I0.0 A %I0.1 O %I0.2 = %Q0.0 BE
00: 7070 0101 0108 0001 0000 0074 0000 0000 10: 02ab 2735 2d03 03a1 6383 21a7 001c 0006 20: 0014 000a c000 c100 ca00 d880 6500 0100 30: 0014 0000 0002 0502 0502 0502 0502 0502 40: 0505 0505 0505 050e 0520 0100 0800 0000 50: 0000 0000 0000 0000 0000 0000 0000 0000 60: 0000 0000 0000 0000 0100 a691 0000 0000 70: 0000 0000

S7comm

S7comm
S7comm Protocol Structure

S7comm
Download Procedure

S7comm
protocol details
Wireshark can dissect S7comm with the dissector available at
http://sourceforge.net/projects/ s7commwireshark/
SCADACS

S7comm
Communication setup

S7comm
Communication setup

S7comm
Communication setup

S7comm
List all blocks

S7comm
List all blocks

S7comm
List all OBs

S7comm
List all OBs

S7comm
Download OB 1 to PLC

S7comm
Download OB 1 to PLC

S7comm
Download OB 1 to PLC

S7comm
Download OB 1 to PLC

S7comm
Insert OB 1 into filesystem

S7comm
Insert OB 1 into filesystem

Attack Overview
SCADACS

Attack Overview
Instrumenting live PLC programs with own malware
 Upload original PLC code to your machine  Prepend your own code to the original code (also used by
Stuxnet)  Download the modified code to the PLC again  Next cycle executes new code, without service disruption
SCADACS

Attack Overview
PLC Code Injection

 Example PLC code which calls FB 1

SCADACS

Attack Overview
PLC Code Injection
 OB1 with prepended malicous function call to FC 666
SCADACS

Attack
SCADACS

Attack
1. Instrumenting live PLC programs with scanning malware 2. SNMP scanning 3. Collecting the scan results 4. Instrumenting live PLC programs with proxy malware 5. Connecting to PLCs through the proxy malware
SCADACS

Attack I
Overview
PLC 1 is connected to the Internet

Attack II
Overview
Attacker downloads the main program block. . .

Attack III
Overview
. . . patches it and uploads a SMNP scanner

Attack IV
Overview
The local network is scanned

Attack V
Overview
Attacker downloads the scanning results

Attack VI
Overview
A SOCKS proxy enables him to reach the net behind the PLC

Attack I
SNMP Scanner - Details
 Get the PLC's IP

Attack II
SNMP Scanner - Details
 Calculate the subnet mask

Attack III
SNMP Scanner - Details
 Configure UDP connection

Attack IV
SNMP Scanner - Details
 Send UDP packets (SNMP get request)

SOCKS5 Proxy - Details

SOCKS5 Proxy - Details I
 SOCKS5 protocol (RFC 1928)  without authentication or encryption

SOCKS5 Proxy - Details II
Jump list for state machine

SOCKS5 Proxy - Details III
Bind and listen for incoming connections

SOCKS5 Proxy - Details IV
Receive clients authentication negotiation

SOCKS5 Proxy - Details V
Reply with no authentication

SOCKS5 Proxy - Details VI
Receive clients connect request. . .

SOCKS5 Proxy - Details VII
. . . and store IP and port

SOCKS5 Proxy - Details VIII
Connect to destination host. . .

SOCKS5 Proxy - Details IX
. . . and prepare a confirmation message. . .

SOCKS5 Proxy - Details X
. . . and send it to the client

SOCKS5 Proxy - Details XI
 connection to client and destination host are established  now we can proxy
 send client's messages to destination and vice versa  an error while receiving means one partner disconnected  send remaining data then disconnect and wait for next
client

SOCKS5 Proxy - Details XII
 The SOCKS implementation on the PLC is able to transfer up to 730 KB/s if it is running alone.
 In combination with a memory intensive benchmark PLC programm the proxy was able to transfer up to 40KB/s.

Attack Video
SOCKS5 Proxy - Details
Connecting to PLCs through the proxy malware ...Video Presentation...

Evaluation

Evaluation
Questions
 Can such attack detected by timing?  Can the attack exceed the default cycle time of 150ms?

Measurements I
How to measure  Pull data from OB1 PREV CYCLE variable  Store the result in a DB  Upload DB from PLC  Compare values for the baseline programm and the SOCKS Proxy (idle / under load)

Measurements II

Measurements III

Mean Std. Deviation Std. Error

Baseline 85.32 0.4927 0.01089

Proxy idle 85.40 0.5003 0.01106

Proxy under load 86.67 0.5239 0.01158

Result:
 There exists a significant but not relevant timing difference between the baseline program and its malicous SOCKS proxy version regarding the default cycle time of 150 ms.

PLCinject

PLCinject
Release
 How to use PLC Inject  example

PLCinject
Live Demo
PLCinject with example Payload (running light) and a PLC

Mitigation strategies

Mitigation strategies
1. Enabling protection-level 3 2. Network-level access control 3. If all else fails, means to woo deities to lend disaster
protection

Summary

Summary
 An internet facing PLC can be used as a gateway without service disruption
 This enables an attacker to reach indirect Internet connected PLCs too
 Taking these indirect connected systems into account, the attack surface regarding ICS could be much bigger than expected

Q&A

