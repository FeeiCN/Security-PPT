Fuck 0-days, we will pwn u with hardware mofos

MC & Yaniv Miron
Security 1337s @ FortConsult
Greetz vangelis ­ we didn't believe you would accepted the title dude ­ bigg up!

Powerpoint Templates

Page 1

/ About MC
· Intercontinental man of mystery and security consultant
· Performs security testing and assessments on most continents
· Works in Fcon² team at FortConsult in Copenhagen, Denmark
· From Peahi, Maui
· Used to rock the house on the ones and twos

Powerpoint Templates

Page 2

/ About Yaniv Miron
· Yaniv Miron aka Lament
· Security Researcher and Consultant @ FortConsult in Copenhagen, Denmark.
· Found security vulnerabilities in IBM, Oracle, Microsoft and Apache products as in other products
· CISO Certified from the Technion (Israel Institute of Technology)
· Certified Locksmith

Powerpoint Templates

Page 3

/ About FortConsult
· Founded in 2002 by Ulf Munkedal · Located @ Copenhagen, Denmark · Doing cool stuff, for real · Go ahead, challenge us

Powerpoint Templates

Page 4

Agenda

· This is not a GANGNAM STYLE talk, it's placed outside

· WTF?! is hardware hacking (dude, it's not moding...come on)

· Hardware hacking today

· Our hardware hacking tools

· Build your own hardware hacking toolkit

· 5 for real hardware hacking DEMOs ­ we know PoC does not take theoretical crap

·Q&A
Powerpoint Templates

Page 5

Things to Know Ahead
· 0-day ­ well... · pwn ­ check in the dictionary · mofos ­ check in the dictionary · 1+1=3 for high values of 1 · PoC and vangelis doesn't like crap

Powerpoint Templates

Page 6

Hacking ? Use Hardware
· OWASP Top 10? When was the last time you have pwned something with it? · Fast ­ go go go · Unexpected and unchecked · When was the last time somebody bought a hacking test with hardware?

Powerpoint Templates

Page 7

Hacking ­ Long Tail

Hardware Hacking

Powerpoint Templates
Props to ReL1k at trustedsec.com for the diagram

Page 8

How to Build Your Kit
·You need some $$$ - not much but... ·You need us to tell you what to buy ·You need a valid address ·You need some learning time ·You need a lab to practice

Powerpoint Templates

Page 9

How to Build Your Kit (cont.)
·We will recommend the top 5 tools for your "Hardware Hacking Kit"
· We will recommend the lab that you need to build to test them
· We will explain how and where to buy the items for your kit

Powerpoint Templates

Page 10

FireWire
· Apple's name for the IEEE 1394 High Speed Serial Bus · FireWire supports multiple hosts per bus, plug and play and hot swapping · FireWire versions >> 400 and 800 · Supports Direct-Memory-Access (DMA) · FireWire can have communication in both directions at the same time

Powerpoint Templates

Page 11

FireWire ­ Security
· In SBP-2 (Serial Bus Protocol 2) used by FireWire the controlling device sends a request by remotely writing a command to specified area of the target's FireWire address space
· Mapping between FireWire "Physical Memory Space" and device physical memory is done in hardware
· No operating system intervention
· What could possibly go wrong ; )?

Powerpoint Templates

Page 12

FireWire ­ Hardware
· FireWire / Thunderbolt / ExpressCard / PCMCIA interface on attack and victim machine
· No native FireWire plug? >> add adapter to expand PCIe bus and hotplug it
· Firewire cable to connect interfaces

Powerpoint Templates

Page 13

FireWire ­ History
· Winlockpwn ­ Kiwicon 2008 Metlstorm · Pwned XP targets well · Unofficial tweaks and updates · Linux Kernel 2.6.22 new Juju FireWire stack · FTWAutopwn now called Inception http://www.breaknenter.org/projects/inc eption/

Phat

props

to

@Pmoewtlsetroprmoi(nAtdTam emBopilleaatue)sand

@breaknenter

(Carsten Maartmann-Moe)
Page 14

FireWire ­ Software
· Inception tool
· Requires Linux with JuJu IEEE FireWire stack e.g. Ubuntu 11 and later
· Python 3
· Libforensics1394
· Pwns WinXP SP2-3, Win7 SP0-1, Vista SP0 SP2, Win 8 SP0, Mac OSX Snow Leopard Lion Mountain Lion, Ubuntu 11.04 11.10 12.04 x86 and x64

Powerpoint Templates

Page 15

FireWire ­ Pwnage

· Inception tool
· Patch victim memory to bypass password
· Dump victim memory (4Gb limit due to FW 32-bit limitation)
· Pick pocket mode >> auto dump from victims that connect to FireWire or Thunderbolt daisychain
· This means typical corporate laptop with Win7 Bitlocker full disk crypto is often pwned

Powerpoint Templates

Page 16

FireWire ­ Pwnage (cont.)
· Search pwned memory dump or hard drive for credentials, keys, hashes etc
· Use volatility tool to carve valuable data from memory dump to plan and execute other attacks
· Use obtained data loot to penetrate other systems e.g. move laterally into organization and pwn systems the victim had access

Powerpoint Templates

Page 17

FireWire ­ Pwnage (cont.)

Powerpoint Templates

Page 18

FireWire ­ Demo

Powerpoint Templates

Page 19

FireWire ­ Recipe
· HW: FireWire PCMCIA / PCExpress card, eBay or Amazon · HW: Firewire cable (400/800) with 4/6/9 pole connector to connect attack laptop to victim, eBay or Amazon · SW: Linux with IEEE1394 Juju Stack · SW: libforensics driver, Python 3 · SW: Inception

Powerpoint Templates

Page 20

FireWire ­ Recipe (cont.)

· Find victim laptop and insert FW card (PCMCIA/PCExpress) if there is no FW port

· Connect Linux attack machine to victim over FW and run inception to bypass login

· Rape and pillage hard drive >> login credentials, emails, budgets, contracts etc

· If there is a pre-boot auth password wait until the machine is booted and locked with screen saver before attacking

· If login bypass fails, then dump memory

and rinse and repeat as above

Powerpoint Templates

Page 21

Teensy
· The Teensy is a complete USB-based microcontroller development system, in a very small footprint, capable of implementing many types of projects. All programming is done via the USB port. No special programmer is needed, only a standard "Mini-B" USB cable and a PC or Macintosh with a USB port.

Powerpoint Templates

Page 22

Teensy ­ What Is It ?
· A very fast keyboard in our case · A cool hardware hacking device · Our little friend when somebody turns around for a sec...

Powerpoint Templates

Page 23

Teensy ­ Software
· So we need the Teensy App
· And the Arduino 1.0.1

Powerpoint Templates

Page 24

Teensy ­ Coding

Powerpoint Templates

Page 25

Teensy ­ Coding (cont.)

Powerpoint Templates Taken from illwill @ http://www.nesit.org board

Page

26

Teensy ­ Coding (cont. 2)

Powerpoint Templates

Page 27

Teensy ­ Coding (cont. 3)

Powerpoint Templates

Page 28

Teensy ­ XP vs 7
· cmd vs rcmd · This is like a human typing on a keyboard...don't do TYPOS · But you know... Teensy will pwn them both

Powerpoint Templates

Page 29

Teensy ­ Hardware
· There are different teensy · We are using Teensy 2.0

Powerpoint Templates

Page 30

Teensy ­ Demo

Powerpoint Templates

Page 31

Teensy ­ Recipe

· Buy

it

http://www.pjrc.com/teensy

here:

· Install

the

loader

application:

http://www.pjrc.com/teensy/loader.html

· (remember that the orange light should blink at first use)

· Download the Arduino Software

· Code some cool stuff and upload it

· Attack!

Powerpoint Templates

Page 32

PineApple

· Cracking WEP or WPA key >> boring
· Inverse war driving more fun
· Let victims connect and MITM them
· Works well, most people are cheapskates and love free wifi
· Target rich areas are airports, hotels, coffee shops and so on
· Also corporate environments that do not offer wifi for private or guest use

Powerpoint Templates

Page 33

PineApple ­ History
· 2004 Karma tool Shane Macaulay & Dino Dai Zovi
· 2008 Karmetasploit HD Moore
· 2008 Jasager on OpenWRT Fon 2100 Robin Wood and Hak5
· Since then many upgrades, tweaks and implementations
· Netbooks with Atheros or Prism54 chipset, Pineapple, Pwnphone etc

Powerpoint Templates

Page 34

PineApple ­ History (cont.)

Powerpoint Templates

Page 35

PineApple Laptop Tools

· Laptop with Linux e.g. Ubuntu

· Wifi interface supporting monitor mode and injection e.g. Atheros

· Aircrack-NG

· DHCP server

· Metasploit framework

· Database backend

· EEE900 with built-in Atheros and Linux installed one option

Powerpoint Templates

Page 36

PineApple ­ Standalone
· Alfa AP121U running OpenWRT flashed with Pineapple mk4 firmware
· Nokia 900 with injection driver and manually installed tools or Pwnphone software
· Legacy ­ Fonera 2100 with Jasager Firmware
· Legacy ­ Alfa AP51 flashed with Pineapple mk3

Powerpoint Templates

Page 37

PineApple ­ UnBricking
· Bricked routers or with no OpenWRT need to be reflashed · Always check the MD5 before flashing · Acquire USB/serial to UART cable for low level serial firmware flashing · PL2303 or Silicon Labs CP210x chipset

Powerpoint Templates

Page 38

PineApple ­ UnBricking (cont.)

Powerpoint Templates

Page 39

PineApple ­ UnBricking (cont. 2)
· Disconnect power on router
· Remove two front rubber feet on bottom of the router
· Remove two screws and open case
· Connect RX, TX and GND pins on router to adapter (some cheapskate adapters may have TX and RX labels flipped)
· Do not connect VDD use the router power adapter
Pic from wifipineapple.com

Powerpoint Templates

Page 40

PineApple ­ UnBricking (cont. 3)
· Use Linux ­ everything is easier

· Make sure the USB serial adapter is recognized

· Check with lsusb command

· Note vendor and device ID for adapter e.g. Bus 002 Device 008: ID 10c4:ea60 Cygnal Integrated Products, Inc. CP210x Composite Device means vendor=0x10c4 product=0xea60

· Perform modprobe command with noted

IDs e.g. sudo modprobe usbserial

vendor=0x10c4 product=0xea60

Powerpoint Templates

Page 41

PineApple ­ UnBricking (cont 4.)
· Check with dmesg command that adapter is working
· The USB serial adapter should be connected to ttyUSBx where x can be 0,1,2 ... e.g [ 9643.936962] usb 2-1.1: cp210x converter now attached to ttyUSB0
· Connect an ethernet cable between the router POE port and the Linux laptop
· Set the Linux wired interface to static IP address 192.168.2.11

Powerpoint Templates

Page 42

PineApple ­ UnBricking (cont. 5)
· Install a tfp server e.g download and extract tftpgui from http://code.google.com/p/tftpgui/downl oads/list
· Install a terminal emulator e.g. sudo aptget gtkterm, configure 115200 baud, 8 data bits, no parity, 1 stop bit, no flow control and select the correct ttyUSBx device from previous step e.g. ttyUSB0
· Download the factory file http://cloud.wifipineapple.com/firmware /factoryFiles.tar

Powerpoint Templates

Page 43

PineApple ­ UnBricking (cont. 6)
· Extract the factory files to the tftpgui/tftproot/ directory i.e. kernel.bin and rootfs.bin

· Start the tftp server sudo python tftpgui -nogui

· Download the pineapple firmware to be flashed from http://cloud.wifipineapple.com/index.php ?downloads e.g. stable 2.5.0

Verify that the MD5 is correct i.e. md5sum

<firmware file name> e.g.

045d880620215fa8ae4fdc7826bf0fc8 for v

2.5.0

Powerpoint Templates

Page 44

PineApple ­ UnBricking (cont. 7)
· Connect the power adapter to router
· Be quick and select 1 from the menu to get shell
· Enter commands below

· Reboot router
Powerpoint Templates

Page 45

PineApple ­ UnBricking (cont. 8)
· Wait for router to reboot
· Hit enter to get shell
· Use passwd command to reset the root password and reboot router
· Set Linux machine wired interface to 172.16.42.42
· Use scp to copy over firmware to the router e.g. scp <firmware file name> root@172.16.42.1

Powerpoint Templates

Page 46

PineApple ­ UnBricking (cont. 9)
· Ssh into router i.e. ssh root@172.16.42.1
· Upgrade the router firmware i.e. sysupgrade -n -v /tmp/<firmware file name>
· Wait for the router upgrading to finish (a couple of minutes)
· Flashing complete
· More info at http://cloud.wifipineapple.com/index.php ?flashing

Powerpoint Templates

Page 47

PineApple ­ Web Gui

Powerpoint Templates

Page 48

PineApple ­ Weaponized

Powerpoint Templates

Page 49

PineApple ­ Luvz Hak5 NOT !!!
· DO NOT BUY FROM HAK5 ­ DO NOT !!!
· Haha Shannon, haha

Powerpoint Templates

Page 50

PineApple - Demo

Powerpoint Templates

Page 51

PineApple - Recipe

· HW: Alfa Hornet AP121U w/ OpenWRT http://www.data-alliance.net/servlet/strse-667/Alfa-Open-dsh-WRT-802.11nAP/Detail

· HW: USB to UART TTL adapter PL2303 or CP210x chipset on eBay e.g. www.ebay.co.uk/sch/i.html?_nkw=USB+ uart+ttl

· HW: Rechargable battery pack 12V e.g. Astro3 Anker 10000mAh on Amazon

· SW: Wifipineapple.com

http://cloud.wifipineapple.com/index.php

?downloads

Powerpoint Templates

Page 52

PineApple ­ Recipe (cont.)
· HW+SW: Alternatively get small notebook with Atheros chipset e.g. Asus EEE900 on eBay
· HW+SW: Alternatively get Nokia N900 on eBay and load PwnPhone community edition http://pwnieexpress.com/pages/commun ity-downloads or install tools manually with package manager

Powerpoint Templates

Page 53

PineApple ­ Recipe (cont. 2)

· Attach Pineapple to battery pack, add USB storage and swap space

· Enable Karma mode, connect Pineapple to Linux machine with Internet access (wifi or 3G) and share it with Pineapple

· Run SSLstrip or make a nice phishing page tailored for your main target or code evil java script injection payload

· Goto an airport, hotel or coffee shop where your targets hangout and free wifi is scarce

· Rape and pillage target with MITM

attackPsowerpoint Templates

Page 54

KeyLoggers

· What is a KeyLogger?

· Keystroke logging (more often called

keylogging or "keyloggers") is the

action of tracking (or logging) the

keys struck on a keyboard, typically

in a covert manner so that the person

using the keyboard is unaware that

their actions are being monitored.

There are numerous keylogging

methods, ranging from hardware and

software-based approaches to

electromagnetic

and

acoustic

analysis.

-Thanks wikipedia

Powerpoint Templates

Page 55

KeyLoggers - Past
· You need physical access · You need to plug it to the keyboard · Usually PS2 or USB · Sometime the logs are hard to read · You can't see the mouse · You can't see virtual keyboard · Software keyloggers

Powerpoint Templates

Page 56

KeyLoggers - Future
· Instead of reading logs, I'll just see what you are doing · VGA · DVI · HDMI

Powerpoint Templates

Page 57

KeyLoggers - Screens
· Almost any screen could be monitored · Very simple and easy · We just need to plug the video and USB connector and we are ready · DVI · VGA · HDMI

Powerpoint Templates

Page 58

KeyLoggers - InSide
· Anyone open their keyboard lately? · Small things, but still we need space for it · Not that fast installation

· Without Keylogger

· With Keylogger
Powerpoint Templates

Page 59

KeyLoggers ­ InSide (cont.)
· We need some tools:
· Crimp Connector Housing: 0.1 inch pitch 1x4
· Female Crimp Pins for 0.1" Housings
· Crimping Tool: 0.1-1.0 mm² Capacity, 16-28 AWG SN-28B

Powerpoint Templates

Page 60

KeyLoggers ­ InSide (cont. 2)
· This is an open keyboard with the module:

Powerpoint Templates

Page 61

KeyLoggers - Serial
· Yes, there are also serial keyloggers · Printers keyloggers · Payment devices keyloggers

Powerpoint Templates

Page 62

KeyLoggers - Demo

Powerpoint Templates

Page 63

KeyLoggers - Recipe

· VideoGhost:

· https://www.keelog.com/hardware_ video_logger.html
· · VGA

· DVI

· HDMI

· Plug it between the screen and the machine

· Plug the USB from the cable to the machine

Powerpoint Templates

Page 64

KeyLoggers - Recipe
· Keyboard ­ just a simple one with enough space
· Open the keyboard
· User guide: https://www.keelog.com/files/KeyGrabb erModuleUsersGuide.pdf
· B K S ­ the magic letters (change them!)

Powerpoint Templates

Page 65

RFID

· Many business use proximity cards to control physical access
· Many such implementations use cards that can be cloned
· If the implementation is not secure then cloned cards can be used to gain physical access
· Companies may have shiny expensive prox card equipment but the security features may be misconfigured or not enabled

Powerpoint Templates

Page 66

RFID (cont.)
· Most prox card use proprietary encoding and data formats
· This talk >> Limited to Low Frequency 125KHz cards using Frequency Shift Keying (FSK) technology
· Numerous vendors e.g. HID, Honeywell, Keyscan and others offer such solutions
· These solutions are popular and often implemented in corporate environments

Powerpoint Templates

Page 67

RFID (cont. 2)
· Systems consists of tags, readers and a backend control system
· Tags contain an antenna and a chip and are usually passive
· Passive cards require the reader to provide power for communication

Powerpoint Templates

Page 68

RFID (cont. 3)
· One of the most popular commercial solutions is HID ProxCard · Still used despite security weaknesses · Card stores a 44-bit value sent to the backend via a reader to grant or deny access · Only 26-bits are used for authentication · What could possibly go wrong ; ) ?

Powerpoint Templates

Page 69

RFID ­ Pwn Time
· Reading a victim's prox card means the attacker knows the 26-bits
· Roll your own or buy a reader
· Add battery pack to power reader for portability
· Maximize read range for maximum leetness
· Most readers requires card to be within 3-4 inches >> GTFU

Powerpoint Templates

Page 70

RFID ­ Pwn Time (cont.)
· HID Maxiprox 5375 long-range reader
· Reads ProxCards II at ~24 inches powered with 12V
· Data is output through Wiegand interface

Props to Carl at proxclone.com for this awesome idea

Powerpoint Templates

Page 71

RFID ­ Protocols
· Wiegand interface connects readers (RFID and magstripe) to physical security control backend control systems
· Wiegand has two data wires (Data0 and Data1) and ground
· No data sent >> Data0 and Data1 is pulled up to high voltage +5V
· Data sent >> one line is pulled to low voltage

Powerpoint Templates

Page 72

RFID ­ Protocols (cont.)
· Wiegand data format is 26 bits · Facility code is 8 bits · Card number (user ID) is 16 bits · Parity bit leading and trailing

Powerpoint Templates

Page 73

RFID ­ Mod Time
· Add Pro Micro 16Mhz 5V for decoding Wiegand output from reader · Add battery pack and SD card module to save read prox card loot · Upload code to Pro Micro to read Wiegand output, decode to binary and save to SD card
PowerpoinPt rToepms ptolactoelsligomentis.com for ArdPuiangoeco7d4e bits

RFID - FrankenClone

Powerpoint Templates

Page 75

RFID - Demo

· Logging functionality disabled to avoid

Korea pound-you in the ass prison

sentenPcoewerpoint Templates

Page 76

RFID ­ Cloning
· FrankenClone read victim cards and the 26-bits required to authenticate to the backend
· We g0tz an SD card with facility and user IDs
· T55x7 cards to the rescue
· Emulation of most 125Khz RFID tags possible with T55x7 cards
· 100K+ rewrites after initial programming

Powerpoint Templates

Page 77

RFID ­ Card Cloning
· Programming T55x7 cards with facility and user IDs requires a writer · Roll own or buy one · Russian options include Keymaster Pro 4 and Proxy Key T5

Powerpoint Templates

Page 78

RFID ­ Emulation
· Proxmark3 can emulate T55x7 cards
· More phun though is the possibility to emulate cards and brute force code https://github.com/bradanton/proxbrute.git
· If a facility and user IDs is known then trying nearby numbers is useful since employees may have different physical access rights.

Props to brad antoniewicz at foundstone for proxbrute

Powerpoint Templates

Page 79

RFID ­ Recipe

· HW: HID Maxiprox, eBay · HW: Pro Micro 5V 16Mhz, https://www.sparkfun.com/products/110 98 · HW: SD card module, https://www.sparkfun.com/products/544 · HW: Battery holder, eBay · HW: Micro USB male connector, eBay · HW: Wires, eBay · HW: Rechargeable AA batteries, eBay · SW: Aruino code, http://colligomentis.com/wpcontent/uploads/2012/05/HID_Card_Cat cher_NoKeypad_Micro.txt

Powerpoint Templates

Page 80

RFID ­ Recipe (cont.)
· HW: Keymaster Pro RF 4, Google Russia or Ukraine
· HW: Prox Key T5, Google Russia or Ukraine
· HW: Proxmark3 eBay or http://proxmark3.com/

Powerpoint Templates

Page 81

RFID ­ Recipe (cont. 2)

· Turn on FrankenCloner and throw it in a bag

· Goto to a lunch area or elevator where targets hangout and sweep for prox cards

· Use gathered facility and site codes to clone prox cards with prox card writer and T55x7 cards

· Take cloned cards and enter facility

· Alternatively use Proxmark3 to emulate cards and bruteforce ranges to gain access to additional areas

Powerpoint Templates

Page 82

BlueTooth
· So there are different people saying that it can be sniffed with simple BT tokens · BC2-Ext, BC3-Ext, BC4-Ext · UberTooth One ­ maybe? · Trying tons of them...not really working

Powerpoint Templates

Page 83

OpenBTS

· OpenBTS (Open Base Transceiver Station) GSM software-based access point
· Requires hardware from Ettus Research e.g. USRP1 plus TX and RX board for your GSM band plus antennas for each
· 52 MHz clock e.g. Clock Tamer
· Unlocked mobiles phones and sim cards
· SIM card writer
· Computer running OpenBTS software

Powerpoint Templates

Page 84

Cold Boot Attack
· CBA = Cold Boot Attack · Princeton research · Small size RAM · Air Spray · Luck · Tools to analyze the info

Powerpoint Templates

Page 85

PwnPlug
· Sheeva plug with PwnieExpress software · Community edition is free · Inexpensive demo/floor models may be available · New mini version released (beware - no JTAG/serial port!)

Powerpoint Templates

Page 86

PwnPhone
· Nokia N900 running PwnieExpress software · Community Edition is free · Also possible to install Metasploit, Nmap, wifi injection driver manually

Powerpoint Templates

Page 87

To Wrap It All Up
· Hardware hacking is da new thing · You don't need to have tons of $$$ to use it · It gets simpler and simpler · Build hardware tools and pwn stuff

Powerpoint Templates

Page 88

# E [0] F #
Questions?
>>
Yaniv Miron aka Lament ymt [AT] fortconsult [DOT] net (work) lament@ilhack.org (private)
MC mc@fortconsult.net (work)

Powerpoint Templates

Page 89

