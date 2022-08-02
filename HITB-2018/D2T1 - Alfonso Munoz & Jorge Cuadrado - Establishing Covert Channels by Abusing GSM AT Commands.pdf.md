Call me Maybe! ­ Establishing covert channels by abusing GSM AT Commands
dd
Dr. Alfonso Muñoz (@mindcrypt) - Jorge Cuadrado (@Coke727)

Dr. Alfonso Muñoz - @mindcrypt Head of Cybersecurity Lab ­
- Expert Member / Criminal Use of Information Hiding (CUIng) Initative (Europol European Cybercrime Centre -EC3) - Speaker in hacking conferences (Deepsec, HackInTheBox, VirtusBulletin, 8.8, RootedCon, STIC CCN-CERT, ...) - CISA (Certified Information Systems Auditor), CEHv8 (Certified Ethical Hacker), CHFIv8 (Computer Hacking Forensic
Investigator), CES (Certified Encryption Specialist) and OSCP (Offensive Security Certified Professional) - +60 academic publications (IEEE, ACM, JCR, hacking conferences...), books and computer security tools. He has
also worked in advanced projects with European Organisms, public bodies and multinational companies (global 500) www.linkedin.com/in/alfonsomuñoz & http://alfonsocv.com & alfonso@criptored.com
Jorge Cuadrado @coke727 Security Researcher ­
Jorge has a Bsc. in Computer Science by the University of Valladolid (UVa) and Masters in Cyber security by the University Carlos III of Madrid (UC3M). He is currently working in a cybersecurity and innovation laboratory as a researcher.
www.linkedin.com/in/jorgecuadradosaez && jorgecuadradosaez@gmail.com
Call me Maybe! ­ Establishing covert channels by abusing GSM AT Commands

Alfonso Muñoz (@mindcrypt) - Jorge Cuadrado (@Coke727)

Phreaking
Phreaking is a slang term coined to describe the activity of a culture of people who study, experiment with, or explore telecommunication systems, such as equipment and systems connected to public telephone networks. The term phreak is a sensational spelling of the word freak with the ph-from phone, and may also refer to the use of audio frequencies to manipulate a phone system. Phreak, phreaker, or phone phreak are names used for and by individuals who participate in phreaking...
https://en.wikipedia.org/wiki/Phreaking

http://www.historyofphonephreaking.org/faq.php & http://explodingthephone.com

https://www.thingiverse.com/thing:2630646/#files

The beginning

Mobile phone: Golden nugget!
https://www.theguardian.com/world/2014/jan/27/nsa-gchq-smartphone-app-angry-birds-personal-data
https://www.tjoe.org/pub/direct-radio-introspection

DeepSec 2010: All your baseband are belong to us by Ralf Philipp Weinmann -
https://www.youtube.com/watch?v=fQqv0v14KKY

https://www.theguardian.com/technology/2016/apr/19/ss7 -hack-explained-mobile-phone-vulnerability-snooping-texts-calls
http://www.securitybydefault.com/2015/01/hacking-en-redes-ss7.html
https://thehackernews.com/2017/05/ss7-vulnerability-bank-hacking.html

Another kind of attacks are to the software that manage radio communications:
"Every mobile phone runs two operating systems; the one you interact with (like Android or IOS), and the one that controls the radio hardware. This second OS is ancient, creaking, and wildly insecure..."
https://boingboing.net/2016/07/20/baseband-vulnerability-could-m.html http://www.osnews.com/story/27416/The_second_operating_system_hiding_in_every_mobile_phone

http://www.infosecisland.com/blogview/12656-The-SMS-of-Death-Mobile-Phone-Attack-Explained.html

http://fortune.com/2015/07/27/stagefright-android-vulnerability-text/

https://www.cnet.com/news/researchers-can-attack-mobile-phones-via-spoofed-sms-messages/

Secraphony...
http://tronland.org/

Homemade Phreaking ­ Making our own mobile phone
Yes, I am a criminal. My crime is that of curiosity (The Mentor - January 8, 1986) http://phrack.org/issues/7/3.html

Homemade Phreaking ­ Making our own mobile phone
https://github.com/jorcuad/FreePhone/wiki

https://github.com/jorcuad/FreePhone/wiki

Our research

Covert Channel
In computer security, a covert channel is a type of computer security attack that creates a capability to transfer information objects between processes that are not supposed to be allowed to communicate by the computer security policy. The term is defined as channels "not intended for information transfer at all, such as the service program's effect on system load," to distinguish it from legitimate channels that are subjected to access controls... (1973 by Lampson)

Interface!!!!
Telephone companies trust in the information sent by
clients?

Interface!!!!

Antena GSM ­ Client attack
http://simcom.ee/modules/gsm-gprs/sim900/
Feature: Chipset SIM900 - SIMCOM

Aihasd SIM900 GSM GPRS Module QuadBand Development Board Wireless Data
for Arduino Raspberry Pi 21 Euros - http://goo.gl/8RgxxZ

Quad-Band 850 / 900/ 1800 / 1900 MHz - would work on GSM networks in all countries across the world.
Control via AT commands - Standard Commands: GSM 07.07 & 07.05 | Enhanced Commands: SIMCOM AT Commands.
The shield allows you to achieve SMS, MMS, GPRS and Audio via UART by sending AT commands
Embedded TCP/UDP stack
Speaker and Headphone jacks Low power consumption - 1.5mA(sleep mode) Industrial Temperature Range - -40°C to +85 °C

SIMs GSM ­ Client attack
On 15 March 2006, the European Union adopted the Data Retention Directive, on "the retention of data generated or processed in connection with the provision of publicly available electronic communications services or of public communications networks and amending Directive 2002/58/EC".[13][14] It requires Member States to ensure that communications providers retain the necessary data as specified in the Directive for a period of between 6 months and 2 years in order to:
·Trace and identify the source of a communication; ·Trace and identify the destination of a communication; ·Identify the date, time, and duration of a communication; ·Identify the type of communication; ·Identify the communication device; ·Identify the location of mobile communication equipment.
The law of conservation of data on electronic communications and public communications networks (Law 25/2007 October DE18) states that service operators should maintain a prepaid SIM logbook stating the identity of the each customer. Data may be required by order of a judge, in order to detect, investigate and prosecute serious crimes...
... "It concluded that data retention was a valuable tool for ensuring criminal justice and public protection, but that it had achieved only limited harmonisation. There were serious concerns from service providers about the compliance costs and from civil society organisations who claim that mandatory data retention was an unacceptable infringement of the fundamental right to privacy and the protection of personal data..."

Interface!!!!
Telephone companies trust in the information sent by
clients?

Interface!!!!

AT commands & Standards
http://simcom.ee/documents/?dir=SIM900

ATD/ATH ­ Call & hang up AT+CLIP - Calling Line Identification Presentation
(the command shows the caller's metadata)
AT+CLIR - Calling Line Identification Restriction AT+MORING - Show State of Mobile Originated Call
(the command shows info when the phone tone sounds in the receiver)
AT+CEER - Extended Error Report AT+VTS - DTMF tone generation AT+EXUNSOL - Enable or Disable Proprietary Unsolicited Indications AT+CLCC - List Current Calls of ME AT+CRC - Set Cellular Result Codes for Incoming Call Indication AT+COLP - Connected Line Identification Presentation

DEMO ­ Abusing GSM using covert channels with AT commands

Antenna Mobile Phone

GSM Network

Antenna Mobile Phone

Setup Tx

Setup Rx

ATD#31 #636666284 Sending: bit 1 Sending: bit 1

Missed call Hidden phone number

Received Call

ACK ATD 636666284
Sending: bit 0

AT+CHUP (BUSY)
Missed call
Received Call

Detail of protocol

Aihasd SIM900 GSM

Arduino

DEMO ­ Abusing GSM using covert channels with AT commands

Covert channel => Hidden capacity (Worst case)
Steganographic techniques considering only ONE SIM + ONE ANTENNA MOBILE PHONE
Missed calls ­ Hidden phone number (8-10 bits/min) Duration of the call (aprox 10 bits/min) Return codes & network disconnection Mixing steganographic techniques (12 bits/min)
What means this?
Capacity/min = aprox 12 bits/min  3 min = 1 IPv4 address | 3 min = TOR addr (URL shortener) | 3 min = GPS coord...
Capacity/hour = aprox 720 bits/hour  IPv4+ addr TOR + addr Bitcoin + GPS Coord + date/time + cryptographic pass + ...
Capacity/day = aprox 17.280 bits/day

Covert channel => Capacity + Delay + Stability
Stability
· No SIM ("registered" and "unregistered/anonymous" prepaid SIM) has been banned in the last 5 months (Spain) ­ 1 hour per day sending information (aprox 720 bits/hour per SIM)
· Example: Maximum Testing time - 2 uninterrupted days ­ Ej./ 34.560 missed calls ­ 34.560 bits (We stopped the test...)
Delay Vs Capacity Vs Invisibility  Amplification techniques
· Virtual phone numbers (Configuration by Internet but working in a 2G Scenario without Internet) · Caller ID Spoofing & Internet Resources & Tricks (Working in a 2G & Internet Scenario)

Virtual phone numbers => Higher Capacity with = SIMs+Antenna
· Higher hiding capacity  More antennas, more SIM cards (*) · Complement or alternative: Virtual phone numbers (free/anonymous and
registered/paid)
GSM/GPRS Modem Pool

Ejemplo ­ Abusing GSM using covert channels with AT commands + Virtual Numbers
Virtual Number 0 (0000b)

Emitter A Send 0001b, Call Number 1

Virtual Number 1 (0001b)
...
Virtual Number 14 (1110b)

Receiver B

Received call from Number1, decode 0001b Virtual Number 15 (1111b)

Ej/ 7*log2(Virtual Numbers) bits/min  Ej/ 28 bits/min, 7 calls/min

DEMO ­ Abusing GSM using covert channels with AT commands + Virtual Numbers
Do The Impossible See The Invisible Row! Row! Fight The Power! Touch The Untouchable Break The Unbreakable Row! Row! Fight The Power! What You Gonna Do Is What You Wanna Do Just Break The Rule, And You See The Truth...
Gurren Laggann - Row Row Fight The Power

DEMO ­ Abusing GSM using covert channels with AT commands + Virtual Numbers

"Phreaking" by Internet & Caller ID Spoofing...

· Services/Devices "with functionalities to call"
· Missed call / SMS "free" / IoT / Shodan ...

· Caller ID Spoofing (Spoofcard, CallerIdFaker, Spooftel...) ·... · Combination & Amplification

Ej, Phone number: 123456789  bits (000000...0000001) Phone number: 123456790  bits (000000...0000010)

Caller ID Spoofing (Phone Number): <Country><City><Number> 2+2+9 digits

Hiding capacity:

VR10,13 = 10^13  13/log2 =43 bits

VR10,9 = 10^9  9 / log 2 = 29 bits

Demo: Covert channel ­ Caller ID Spoofing
Alphabet: Capital letters, lowercase, numbers (64 car 2^6  6 bits) Shortened url from 3 to 5 char  18 to 30 bits (shortened url can have a lot of info) Ej/ tiny.cc/A2bE ­> 24 bits To convert this code to binary  Binary to a phone number (emitter)  Call to the receiver  Apply inverse process

Demo: Covert channel ­ Caller ID Spoofing

Demo: Covert channel ­ Caller ID Spoofing

AT + CONCLUSION CR LF ["APLAUSOS"]
HackintheBox's Blue Box System V1.0
Blue Box coded by @mindcrypt/@coke727 Dial tollfreenumber Set a trunk and dial your number

Call me Maybe! ­ Establishing covert channels by abusing GSM AT Commands
dd
Dr. Alfonso Muñoz (@mindcrypt) - Jorge Cuadrado (@Coke727)

