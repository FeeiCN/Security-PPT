SESSION ID: HT-W03
Hacking a Professional Drone
#RSAC

Nils Rodday
IT Security Consultant

#RSAC
Goal
The goal of this talk is to give insights into the security of Unmanned Aerial Vehicles (UAVs) and to show that professional
UAVs are not as secure as one might think.
2

#RSAC
Agenda
Definition Attack Vectors The UAV Attacks Live Demonstration Remediation Impact Lessons Learned
Q&A
3

#RSAC
Definition
Modelled after: R. Austin, Unmanned Aircraft Systems. UAVs Design, Development and Deployment
4

#RSAC
Example products ­ Physical attack vectors

©Rapere

©AP Photo/Francois Mori
5

#RSAC
Example products ­ Logical attack vectors

©Battelle
6

Denial of Service

#RSAC
Mission statement
Take over the UAV
7

#RSAC
The UAV Under Investigation
8

#RSAC
The UAV ­ Specifications

Add-ons

25k ­ 30k  30k ­ 35k $

3kg Payload 7lb Payload

Advanced Features
9

30 ­ 45min Endurance

#RSAC
The UAV

Telemetry Box Data flow 802.11 WiFi link (WEP)
Not connected (two separate devices)
Remote Control
©IEEE

XBee 868LP link
Data flow
Video link
Data flow
2.4 Ghz Remote Control
link

GPS Receiver

10

#RSAC
The UAV ­ WiFi focus

Data flow 802.11 WiFi link (WEP)

XBee 868LP link
Data flow
Video link
Data flow
2.4 Ghz Remote Control
link

GPS Receiver

11

The UAV ­ WiFi attack
Attacker's tablet
Communication route after attack
Original communication
route Original tablet
12

#RSAC

#RSAC
The UAV ­ XBee focus

Data flow 802.11 WiFi link (WEP)

XBee 868LP link
Data flow
Video link
Data flow
2.4 Ghz Remote Control
link

GPS Receiver

13

#RSAC
XBee ­ Chips
14

#RSAC
XBee ­ Using 3rd party hardware
Software Defined Radio (SDR)
15

#RSAC
XBee ­ Spectral analysis
16

XBee ­ Using XBee chip itself (Obtaining Connection Parameters)
0013A200 40C6662C

#RSAC
18 * 10^18 tries (4.294.967.296 ^2)

0013A200 40C6662C

42 * 10^8 tries (1 * 4.294.967.296)

0013A200 40C6662C
17

16 * 10^6 tries (1 * 16.777.216)

#RSAC
XBee ­ Obtaining Connection Parameters
18

#RSAC
XBee ­ Reading the manual...
1. API mode 2. Broadcast 3. Remote AT
Commands
It's not a bug, it's a feature 
19

#RSAC
XBee ­ Man-in-the-Middle Attack
Attacker

1. Broadcast 3. Remote AT Command:
Change DH + DL
5. Remote AT Command: Write

Communication route after attack

Original communication
route

Tablet

Remote Control

UAV

©IEEE

20

#RSAC
What´s next?
We can read/send data on the XBee channel. But what does that data stream mean?
21

#RSAC
Decompilation of Android APK
22

#RSAC
Decompilation of Android APK

Decimal ­> Hex

36

24

87

57

73

49

70

46

73

49

paramByte

XX

paramByte

XX

paramByte

XX

. . .

23

#RSAC
Example commands
24 57 49 46 49 XX XX XX 24 57 49 46 49 89 89 89 (Start-Engines) 24 57 49 46 49 58 58 58 (Auto-Takeoff) 24 57 49 46 49 97 97 97 (Enable Autopilot)
24

#RSAC
Demonstration
25

#RSAC
Remediation ­ XBee onboard encryption
Secures Data ONLY on the XBee channel Prevents Remote-AT-Commands Mitigates Man-In-The-Middle
27

#RSAC
Remediation ­ Add. Hardware Encryption
Does NOT prevent Remote-AT-Commands Does NOT mitigate Man-in-the-Middle Ensures CONFIDENTIALITY
28

#RSAC
Remediation ­ Application-layer encryption
Does NOT prevent Remote-AT-Commands Does NOT mitigate Man-in-the-Middle Ensures CONFIDENTIALITY
29

Impact

#RSAC
Cost of attack: 40$ UAV is currently in use Multiple manufacturers are using similar setups
30

#RSAC
Lessons Learned
Use strong encryption
Alter passphrases
Test your product
31

#RSAC
Credits

Prof. Dr. Aiko Pras Dr. Ricardo de O. Schmidt

Ruud Verbij Matthieu Paques

Atul Kumar Annika Dahms

32

#RSAC
Contact Details
Nils Rodday

https://de.linkedin.com/in/nilsrodday
33

rodday@arcor.de

SESSION ID: HT-W03
Hacking a Professional Drone
#RSAC

Nils Rodday
IT Security Consultant

#RSAC
Back-Up Slides

#RSAC
Back-Up ­ UAV Commands
36

#RSAC
References
Slide 04: Modelled after R. Austin. Unmanned Aircraft Systems. UAVs Design, Development and Deployment. Wiley, 2010. ISBN: 978-0-470-05819-0. Slide 05: Photo credit to: Rapere Slide 05: Photo credit to: AP Photo/Francois Mori Slide 06: Photo credit to: Battelle Slide 10 & 21: Photo credit to: 978-1-5090-0223-8/16/$31.00 © 2016 IEEE
37

