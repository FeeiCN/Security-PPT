Reversing IoT: Xiaomi
Ecosystem
Gain cloud independence and additional functionality by firmware modification

(CC BY-NC-SA 4.0)

Outline
· Introduction · Xiaomi Cloud · Devices and Rooting
­ Vacuum Cleaning Robot ­ Smart Home Gateway/Lightbulbs/LED Strip

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

2

Outline
· Introduction · Xiaomi Cloud · Devices and Rooting
­ Vacuum Cleaning Robot ­ Smart Home Gateway/Lightbulbs/LED Strip

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

3

Why Xiaomi
"Xiaomi's `Mi Ecosystem' has 50 million connected devices" [1] ,,[...] revenue from its smart hardware ecosystem exceeded 15 billion yuan" (1.9 billion ) [2] Most important: The stuff is cheap

[1] https://techcrunch.com/2017/01/11/xiaomi-2016-to-2017/ [2] https://www.reuters.com/article/us-xiaomi-outlook/chinas-xiaomi-targets-2017sales-of-14-5-billion-after-2016-overhaul-idUSKBN14W0LZ

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

4

Costs
· Vacuum Cleaning Robot Gen1: ~ 260  · Vacuum Cleaning Robot Gen2: ~ 400 

· Smart Home Gateway: ~25 

· Sensors: ~5-14 

· Wifi-Lightbulbs: ~6-12

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

5

Xiaomi News
· Oculus Rift cooperation with Facebook

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

6

Xiaomi News
· Oculus Rift cooperation with Facebook · Xiaomi buys Segway

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

7

How we started

May 2017 Mi Band 2 Vacuum Robot Gen 1

June 2017 Smart Home Gateway + Sensors

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

July 2017 Yeelink Lightbulbs (Color+White) Yeelink LED Strip
8

How we started

October 2017 Yeelink Desklamp Philips Eyecare Desklamp

December 2017 Yeelink/Philips Ceiling Lights Philips Smart LED Lightbulb

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

January 2018 Vacuum Robot Gen 2 Yeelink Bedside Lamp
9

Why Vacuum Robots?

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Source: Xiaomi advertisment
10

Why Vacuum Robots?

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Source: Xiaomi advertisment
11

THE XIAOMI CLOUD

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

12

Xiaomi Cloud

· Different Vendors, one ecosystem ­ Same communication protocol ­ Different technologies used
· ,,Public" guidelines for implementation ­ Implementation differs from manufacturer to manufacturer ­ https://github.com/MiEcosystem/miio_open ­ https://iot.mi.com/index.html

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

13

Xiaomi Ecosystem

WiFi
ZigBee Gateway
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

HTTPS

Xiaomi Cloud
14

Xiaomi Ecosystem

HTTPS
ZigBee Gateway
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Xiaomi Cloud
15

Xiaomi Ecosystem

HTTPS
ZigBee Gateway
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Xiaomi Cloud
16

Device to Cloud Communication

· DeviceID
­ Unique per device
· Keys
­ Cloudkey (16 byte alpha-numeric) · Is used for cloud communication (AES encryption) · Static, is not changed by update or provisioning
­ Token (16 byte alpha-numeric) · Is used for app communication (AES encryption) · Dynamic, is generated at provisioning (connecting to new WiFi)

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

17

Cloud protocol

· Same payload for UDP and TCP stream · Encryption key depending of Cloud/App usage · For unprovisioned devices:
­ During discovery: Token in plaintext in the checksum field

Header Checksum Data

Byte 0,1

Byte 2,3

Byte 4,5,6,7 Byte 8,9,A,B Byte C,D,E,F

Magic:2131 Lenght

00 00 00 00 DID

epoch (big endian)

Md5sum[Header + Key(Cloud)/Token(App) + Data(if exists)]

Encrypted Data (if exists, e.g. if not Ping/Pong or Hello message) · token = for cloud: key; for app: token · key = md5sum(token) · iv = md5sum(key+token) · cipher = AES(key, AES.MODE_CBC, iv, padded plaintext)

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

18

Cloud protocol
· Data ­ JSON-formated messages ­ Packet identified by packetid ­ Structures: · commands: "methods" + "params" · responses : "results" ­ Every command/response confirmed by receiver (except otc)
· Example ­ {'id': 136163637, 'params': {'ap': {'ssid': `myWifi', 'bssid': 'F8:1A:67:CC:BB:AA', 'rssi': 30}, 'hw_ver': 'Linux', 'life': 82614, 'model': 'rockrobo.vacuum.v1', 'netif': {'localIp': '192.168.1.205', 'gw': '192.168.1.1', 'mask': '255.255.255.0'}, 'fw_ver': '3.3.9_003077', 'mac': '34:CE:00:AA:BB:DD', 'token': 'xxx'}, 'partner_id': '', 'method': '_otc.info'}

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

19

Xiaomi Ecosystem

WiFi
ZigBee Gateway
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

HTTPS

Xiaomi Cloud
20

Xiaomi Ecosystem

WiFi
ZigBee Gateway
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

HTTPS

Xiaomi Cloud
21

App to Cloud communication
· Authentication via OAuth · Layered encryption
­ Outside: HTTPs ­ Inside: RC4/AES using a session key
· Separate integrity · Message format: JSON RPC

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

22

App to Cloud communication

· REQ: api.io.mi.com/home/device_list method:POST params:[]
· RES: {"message":"ok","result":{"list":[{"did":"65981234","token":"a bc...zzz","name":"Mi PlugMini","localip":"192.168.99.123", "mac":"34:CE:00:AA:BB:CC","ssid":"IoT","bssid":"FA:1A:67:CC: DD:EE","model":"chuangmi.plug.m1", "longitude":"-71.0872248","latitude":"42.33794500", "adminFlag":1,"shareFlag":0,"permitLevel":16,"isOnline":true, "desc":"Power plug on ","rssi":-47}

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

23

App to Cloud communication

· REQ: api.io.mi.com/home/device_list method:POST params:[]
· RES: {"message":"ok","result":{"list":[{"did":"65981234","token":"a bc...zzz","name":"Mi PlugMini","localip":"192.168.99.123", "mac":"34:CE:00:AA:BB:CC","ssid":"IoT","bssid":"FA:1A:67:CC: DD:EE","model":"chuangmi.plug.m1", "longitude":"-71.0872248","latitude":"42.33794500", "adminFlag":1,"shareFlag":0,"permitLevel":16,"isOnline":true, "desc":"Power plug on ","rssi":-47}

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

24

App to Cloud communication
· "longitude":"-71.0872248","latitude":"42.33794500"

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Source: Openstreetmaps
25

LETS TAKE A LOOK AT THE PRODUCTS

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

26

Products
Different architectures · ARM Cortex-A · ARM Cortex-M
­ Marvell 88MW30X (integrated WiFi) ­ Mediatek MT7687N (integrated WiFi + BT-LE) · MIPS · Xtensa ­ ESP8266, ESP32 (integrated WiFi)

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

27

Operation Systems
· Ubuntu 14.04 ­ Vaccum cleaning robots
· Embedded Linux ­ IP cameras
· RTOS ­ Smart Home products ­ Lightbulbs, ceiling lights, light strips

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

28

Implementations

Vacuum Robot

Smart Home Gateway Philips Ceiling Light

Manufacturer Rockrobo

MCU

Allwinner + STM + TI

Firmware Update Encrypted + HTTPS

Lumi United Marvell (WiFi) Not Encrypted

Debug Interfaces Protected

Available

Yeelight Mediatek (WiFi + BLE) Not Encrypted + HTTPS (No Cert!) Available

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

29

Implementations

Vacuum Robot

Smart Home Gateway Philips Ceiling Light

Manufacturer Rockrobo

MCU

Allwinner + STM + TI

Firmware Update Encrypted + HTTPS

Debug Interfaces Protected

Lumi United Marvell (WiFi) Not Encrypted
Available
Bonus: Chinese device, but unknown communication to Server in Salt Lake City, USA

Yeelight Mediatek (WiFi + BLE) Not Encrypted + HTTPS (No Cert!) Available

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

30

LETS GET ACCESS TO THE DEVICES

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

31

VACUUM CLEANING ROBOTS

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

32

Device Overview

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Source: Xiaomi advertisment
33

Overview sensors
· 2D LIDAR SLAM (5*360°/s) · Gen1 only: Ultrasonic distance sensor · multiple IR sensors · 3-axis Magnetic Sensor · 3-axis accelerometer · 3-axis gyroscope · Bump sensors

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

34

Rooting: Challenges
· Hardware-based access ­ Micro USB Port ? ­ Serial Connection on PCB ?
· Network-based access ­ Portscan ? ­ Sniff Network traffic ?

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

35

Teardown

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

36

Frontside layout mainboard

512 MB RAM
R16 SOC

4GB eMMC Flash

STM32 MCU

WiFi Module

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

37

Backside layout mainboard

LIDAR UART
STM UART (921600 baud)
Tx

R16 UART
(115200 baud)
Tx Rx

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

38

Frontside layout mainboard (GEN2)

R16 512 MB SOC RAM

STM32 MCU

WiFi Module

4GB eMMC Flash

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

39

Rooting
· Usual (possibly destructive) way to retrieve the firmware

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

40

Rooting
· Usual (possibly destructive) way to retrieve the firmware

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

41

Rooting
Our weapon of choice:

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

42

Pin Layout CPU

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

UART0

MMC2

MMC1

1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17

MMC

A

Reset D6 D4 D2 D0

D2 D0 CLK

TX UART1

B

D7 D5 D3 D1

D3 D1 CMD

RX

C

CLK

SDA

TWI1

D

RX TX

CMD

SCL

E

Recov Confir

F

ery m

UART2

G

RX TX

Line

H

IN L

LINE

J

IN R

PHO

K

NE IN

PHO

L

NE IN

PHO

MIC1

M

NE

P

PHO

MIC2

N

NE

P

P

SDA SCK RESET RSB0

R

USB- USB-

T

LCD9 LCD7 LCD5 LCD3 LCD1

DM0 DP0 USB 1

USB

USB- USB-

U

LCD8 LCD6 LCD4 LCD2 LCD0 DRV

DM1 DP1 USB 2

DRAM VCC/VDD GND

LCD

43

Rooting
Initial Idea: · Shortcut the MMC data lines · SoC falls back to FEL mode · Load + Execute tool in RAM
­ Via USB connector ­ Dump MMC flash ­ Modify image ­ Rewrite image to flash

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

44

Software
· Ubuntu 14.04.3 LTS (Kernel 3.4.xxx) ­ Mostly untouched, patched on a regular base
· Player 3.10-svn ­ Open-Source Cross-platform robot device interface & server
· Proprietary software (/opt/rockrobo) ­ AppProxy ­ RoboController ­ Miio_Client ­ Custom adbd-version
· iptables firewall enabled ­ Blocks Port 22 (SSHd) + Port 6665 (player)

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

45

Available data on device
· Data ­ Logfiles (syslogs, duration, area, ssid, passwd) ­ "/usr/sbin/tcpdump -i any -s 0 -c 2000 ­w" ­ Maps ­ Multiple MBytes/day
· Data is uploaded to cloud · Factory reset
­ Restores recovery to system ­ Does not delete data
· Maps, Logs still exist

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

46

Available data on device
· Maps ­ Created by player ­ 1024px * 1024px ­ 1px = 5cm

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

47

Available data on device

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Northeastern University, ISEC Building, 6th floor
48

Communication relations

compass uart_lds uart_mcu

player 0.0.0.0:6665
RoboController

wifimgr

AppProxy

<-soundpackages, firmware maps,logs->
Miio_client (local):54322 (tcp) 0.0.0.0:54321 (udp)
Robot intern

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

*.fds.api.xiaomi.com (https)
ot.io.mi.com:80(tcp) ott.io.mi.com:8053(udp)

<-commands, reports->

AES encrypted
Android/ iPhone App

IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
49

Label boot-res env app recovery system_a system_b Download reserve UDISK/Data

eMMC Layout
Content bitmaps & some wav files uboot cmd line device.conf (DID, key, MAC), adb.conf, vinda fallback copy of OS copy of OS (active by default) copy of OS (passive by default) temporary unpacked OS update config + calibration files, blackbox.db logs, maps, pcap files

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Size in MByte 8 16 16 512 512 512 528 16 ~1900
50

Label boot-res env app recovery system_a system_b Download reserve UDISK/Data

eMMC Layout
Content bitmaps & some wav files uboot cmd line device.conf (DID, key, MAC), adb.conf, vinda fallback copy of OS copy of OS (active by default) copy of OS (passive by default) temporary unpacked OS update config + calibration files, blackbox.db logs, maps, pcap files

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Size in MByte 8 16 16 512 512 512 528 16 ~1900
51

Update process

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

52

Update process
miIO.ota {"mode":"normal", "install":"1", "app_url":"https://[URL]/v11_[version].pkg", "file_md5":"[md5]","proc":"dnld install"}

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

53

Update process

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

54

Update process

Active

system_a

copy

system_b

Download

Data

2. Download [app_url]
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

55

Update process

Active

system_a

copy

system_b

Download

Data

2. Download [app_url]
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

56

Update process

Active

system_a

copy

system_b

Download

Data

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

57

Update process

Active

system_a

copy

system_b

Download

Data MD5 ok?

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

58

Update process

Active

system_a

copy

system_b

Download

Data Decrypt + image OK?

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

59

Update process

Active

system_a

copy

system_b

Download

Data Unpack + dd

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

60

Update process

Active

system_a

copy

Update root pw in /etc/shadow

system_b Download

Data

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

61

Update process

Active

system_a

copy

system_b

dd

Download

Data

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

62

Update process
system_a system_b Download
Data

Active copy
rebooting ...

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

63

Update process
system_a system_b Download
Data

Active copy
rebooting ...

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

64

Update process

system_a

dd

system_b

Active copy

Download

Data

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

65

Update process
system_a

system_b

Active copy

Download

Data

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

66

Firmware updates
· Full and partial images
­ Encrypted tar.gz archives ­ Full image contains disk.img
· 512 Mbyte ext4-filesystem
· Encryption
­ Static password: "rockrobo" ­ Ccrypt [256-bit Rijndael encryption (AES)]
· Integrity
­ MD5 provided by cloud

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

67

Firmware updates

· Full and partial images

­ Encrypted tar.gz archives

­ Full image contains disk.img

· 512 Mbyte ext4-filesystem

· Encryption
­ Static password: "rockrobo"

Sound Packages
Static password: "r0ckrobo#23456"

­ Ccrypt [256-bit Rijndael encryption (AES)]

· Integrity

­ MD5 provided by cloud

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

68

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

69

Lets root remotely
· Preparation: Rebuild Firmware
­ Include authorized_keys ­ Remove iptables rule for sshd
· Send ,,miIO.ota" command to vacuum
­ Encrypted with token · From app or unprovisioned state
­ Pointing to own http server

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

70

Lets root remotely
unprovisioned state

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Webserver
71

Lets root remotely
,,Get Token"
unprovisioned state

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Webserver
72

Lets root remotely
,,Get Token"
unprovisioned state

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Webserver
73

Lets root remotely
,,Get Token"

unprovisioned state

,,miIO.ota"

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Webserver
74

Lets root remotely
,,Get Token"

unprovisioned state

,,miIO.ota"

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Webserver
75

Lets root remotely
,,Get Token"
,,miIO.ota"

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Webserver
76

SSH

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

77

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

78

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

79

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

80

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

81

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

82

Gain Independence
Xiaomi Cloud

Two methods: · Replacing the cloud interface · Proxy cloud communication

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

83

Replacing the cloud interface

compass uart_lds uart_mcu

player 0.0.0.0:6665
RoboController

wifimgr

AppProxy

MMy ciilo_ucdlicelnietnt (local):54322 (tcp) 0.h0t.t0p.s0,:5m4q3t2t,1e(tucd...p)
Robot intern

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

*.fds.api.xiaomi.com (https)

ot.io.mi.com:80(tcp) ott.io.mi.com:8053(udp)

<-commands, reports->

Android/ iPhone App
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
84

Replacing the cloud interface

compass uart_lds uart_mcu

player 0.0.0.0:6665
RoboController

wifimgr

AppProxy

Robot intern

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

*.fds.api.xiaomi.com (https)
<-commands, reports->
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
85

Replacing the cloud interface

compass uart_lds uart_mcu

player 0.0.0.0:6665
RoboController

wifimgr

AppProxy

My cloud client (local):54322 (tcp) https, mqtt, etc...
Robot intern

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

*.fds.api.xiaomi.com (https)

<-commands, reports->

FHEM Home Assistant
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
86

Replacing the cloud interface

compass uart_lds uart_mcu

player 0.0.0.0:6665
RoboController

wifimgr

AppProxy

My cloud client (local):54322 (tcp) https, mqtt, etc...
/etcR/hoobstsot intern
127.0.0.1 awsbj0... 127.0.0.1 aswbj0-files... 127.0.0.1 cdn.cnbj0....

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

<-commands, reports->

FHEM Home Assistant
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
87

Proxy cloud communication

compass uart_lds uart_mcu

player 0.0.0.0:6665
RoboController

wifimgr

AppProxy

Miio_client (local):54322 (tcp) 0.0.0.0:54321 (udp)
Robot intern

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

*.fds.api.xiaomi.com (https)
ot.io.mi.com:80(tcp) ott.io.mi.com:8053(udp)

<-commands, reports->

Android/ iPhone App
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
88

Proxy cloud communication

compass uart_lds uart_mcu

player 0.0.0.0:6665
RoboController

wifimgr

AppProxy

Miio_client (local):54322 (tcp) 0.0.0.0:54321 (udp)
Robot intern

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

*.fds.api.xiaomi.com (https)
ot.io.mi.com:80(tcp) ott.io.mi.com:8053(udp)

<-commands, reports->

Android/ iPhone App
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
89

Proxy cloud communication

compass uart_lds uart_mcu

player 0.0.0.0:6665
RoboController

wifimgr

Dustcloud

*.fds.api.xiaomi.com (https)
ot.io.mi.com:80(tcp) ott.io.mi.com:8053(udp)

AppProxy

Miio_client (local):54322 (tcp) 0.0.0.0:54321 (udp)

Robot intern
/etc/hosts
130.83.x.x ot.io.mi.com 130.83.x.x ot.io.mi.com
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

<-commands, reports->

Android/ iPhone App
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
90

Summary of the Vacuum
· Rooting ­ Remote!
· Cloud Connection ­ Run without cloud ­ Run with your own cloud

· Our goal:

We want the Cloudkeys!

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

91

SMART HOME GATEWAY, LIGHTBULBS AND LED STRIPS

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

92

Xiaomi Ecosystem

HTTPS
ZigBee Gateway
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Xiaomi Cloud
93

Xiaomi Ecosystem

HTTPS
ZigBee Gateway
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Xiaomi Cloud
94

Overview Hardware
· Application-MCU: Marvell 88MW30x ­ ARM Cortex-M4F @ 200 MHz ­ RAM: 512KByte SRAM ­ QSPI interface, supports XIP ­ Flash: 16 MByte (Gateway) · 4 Mbyte SPI (LED Strip, Lightbulb) ­ Integrated 802.11b/g/n WiFi Core
· Zigbee-MCU: NXP JN5169 (Gateway only) ­ 32-bit RISC CPU ­ RAM: 32 kB ­ Flash: 512 kB embedded Flash, 4 kB EEPROM

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

95

Sensors connected via gateway
Zigbee (NXP JN5169) based · Door Sensor (Reed contact) · Temperature sensor · Power Plug · Motion Sensor · Button · Smoke Detector · Smart Door Lock ·...

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

96

Acquiring the Key
· PCB got lots of testing points · SWD is enabled by default

SDCLK SDIO

RST TX* GND RX*
*UART
We can get the key from the memdump

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

97

Acquiring the Key
· Can we get the Key without a hardware attack? · Firmware updates are not signed...

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

98

Acquiring the Key
· Can we get the Key without a hardware attack? · Firmware updates are not signed...

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

99

Acquiring the Key
· Can we get the Key without a hardware attack? · Firmware updates are not signed...
Lets create a modified firmware which gives us the key automatically!

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

100

Acquiring the Key
· Can we get the Key without a hardware attack? · Firmware updates are not signed...
Lets create a modified firmware which gives us the key automatically!
No hardware access needed

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

101

Acquiring the Key

· Can we get the Key without a hardware attack? · Firmware updates are not signed...
Lets create a modified firmware which gives us the key automatically!
No hardware access needed The lightbulb runs a bare-metal OS => we need to patch the binary

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

102

Binary Patching: Goals
Branch: Original code
...
Original code

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

103

Binary Patching: Goals
Branch: Original code
...
Original code

Patch code

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

104

Binary Patching: Goals
Branch: Patch code
...
Original code

Patch code

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

105

Binary Patching: Goals
Branch: Patch code
...
Original code

Patch code

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

106

Binary Patching: Goals

· Modify program flow · Add additional code · Use existing functions

Branch: Patch code
...
Original code

Patch code

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

107

Binary Patching: Why can it be hard?
· Overwrite branch instructions New Address = Value of PC + Offset (on ARM)
· Write new code in assembly · Model address space (RAM / ROM / free space) · Call existing functions · Handle different firmware versions and devices

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

108

Binary Patching: Nexmon Framework
definitions.mk

Prerequisite: Know memory layout
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

109

Binary Patching: Nexmon Framework

definitions.mk

Branch: Original code
...

Original code

Prerequisite: Know memory layout
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Patch code
110

Binary Patching: Nexmon Framework

definitions.mk

Branch: Original code
...

Original code

Prerequisite: Know memory layout
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Patch code
111

Binary Patching: Nexmon Framework

definitions.mk

Branch: Original code
...

Original code

Prerequisite: Know memory layout
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

Patch code
112

Binary Patching: Nexmon Framework
wrapper.c

Prerequisite: Know function names and signature
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

113

Binary Patching: Nexmon Framework
Get function names:

main()

0110 1010 0011

Compile Example Project with debug symbols

Load binary into IDA

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

vs
Use Bindiff to apply function names
114

Binary Patching: Nexmon Framework
Putting it all together: Write your patch code in C patch.c

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

115

Binary Patching: Nexmon Framework

Putting it all together: Write your patch code in C patch.c

Branch: Original code
...

Original code

Patch code

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

116

Binary Patching: Nexmon Framework

Putting it all together: Write your patch code in C patch.c

Branch: Original code
...

Original code

Patch code

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

117

* https://hackernoon.com/inside-the-bulb-adventures-inreverse-engineering-smart-bulb-firmware-1b81ce2694a6

Preparing the modified binary (Marvell)

· Preliminary approach for lightbulbs SPI done by Uri Shaked*

· But SPI format != OTA format

Byte 0x00000000 0x00000014 0x00000028 0x0000003C

0-3 Magic 4D 52 56 4C "MRVL" segment magic 02 00 00 00
segment magic 02 00 00 00
segment magic 02 00 00 00

4-7 Magic 7B F1 9C 2E
offset in file C8 00 00 00 0xc8 offset in file 18 37 00 00 0x3718 offset in file 40 4C 08 00 0x84c40

8-11 Timestamp FF BE A8 59
size of segment 50 36 00 00 0x3650 size of segment 28 15 08 00 0x81528 size of segment 54 19 00 00 0x1954

12-15 # of segments 03 00 00 00
mem addr 00 00 10 00 0x100000 mem addr 18 37 00 1F 0x1f003718 mem addr 40 00 00 20 0x20000040

16-19 entry address 19 37 00 1F 0x1f003719 checksum 20 C8 51 7D
checksum 0A 11 25 85
checksum FB 5F ED 39

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

118

* https://hackernoon.com/inside-the-bulb-adventures-inreverse-engineering-smart-bulb-firmware-1b81ce2694a6

Preparing the modified binary (Marvell)

· Preliminary approach for lightbulbs SPI done by Uri Shaked*

· But SPI format != OTA format

Byte 0x00000000 0x00000014 0x00000028 0x0000003C

0-3 Magic 4D 52 56 4C "MRVL" segment magic 02 00 00 00
segment magic 02 00 00 00
segment magic 02 00 00 00

4-7 Magic 7B F1 9C 2E
offset in file C8 00 00 00 0xc8 offset in file 18 37 00 00 0x3718 offset in file 40 4C 08 00 0x84c40

8-11 Timestamp FF BE A8 59
size of segment 50 36 00 00 0x3650 size of segment 28 15 08 00 0x81528 size of segment 54 19 00 00 0x1954

12-15 # of segments 03 00 00 00
mem addr 00 00 10 00 0x100000 mem addr 18 37 00 1F 0x1f003718 mem addr 40 00 00 20 0x20000040

16-19 entry address 19 37 00 1F 0x1f003719 checksum 20 C8 51 7D
checksum 0A 11 25 85
checksum FB 5F ED 39

· Dennis wrote a script for that + Mediatek OTA format 

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

119

Applying the modified firmware
Xiaomi Cloud

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

120

Applying the modified firmware
Xiaomi Cloud

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

121

Applying the modified firmware
Xiaomi Cloud

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

122

Applying the modified firmware
Xiaomi Cloud Xiaomi CDN

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

123

Applying the modified firmware
Xiaomi Cloud Xiaomi CDN

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

124

Applying the modified firmware
Xiaomi Cloud Xiaomi CDN

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

125

Applying the modified firmware
Xiaomi Cloud Xiaomi CDN

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

126

Applying the modified firmware
Xiaomi Cloud

Xiaomi CDN
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

DNS 127

Applying the modified firmware
Xiaomi Cloud

Xiaomi CDN
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

DNS 128

Applying the modified firmware
Xiaomi Cloud

Xiaomi CDN
,,Hillbilly" CDN
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

DNS 129

Applying the modified firmware
Xiaomi Cloud

Xiaomi CDN
,,Hillbilly" CDN
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

DNS 130

Applying the modified firmware
Xiaomi Cloud

Xiaomi CDN
,,Hillbilly" CDN
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

DNS 131

Proxy cloud communication

ot.io.mi.com:80(tcp) ott.io.mi.com:8053(udp)

Dustcloud

DNS Records 130.83.x.x ot.io.mi.com 130.83.x.x ot.io.mi.com
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

<-commands, reports->

Android/ iPhone App
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
132

Proxy cloud communication

ot.io.mi.com:80(tcp) ott.io.mi.com:8053(udp)

Dustcloud

DNS Records 130.83.x.x ot.io.mi.com 130.83.x.x ot.io.mi.com
ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

<-commands, reports->

Android/ iPhone App
IPC plain json (tcp) enc(key) json (tcp/udp) enc(token) json (udp)
133

Other Possible Modifications
· Marvell 88MW30x SDK WiFi sample apps ­ p2p_demo ­ raw_p2p_demo ­ wlan_frame_inject_demo ­ wlan_sniffer

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

134

One word of warning...
· Never leave your devices unprovisioned ­ Someone else can provision it for you · Install malicious firmware · Snoop on your apartment
· Be careful with used devices ­ e.g. Amazon Marketplace ­ Some malicious software may be installed

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

135

Acknowledgements & FAQ
· Secure Mobile Networking (SEEMOO) Labs and CROSSING S1
· Prof. Guevara Noubir (CCIS, Northeastern University)

www.dontvacuum.me

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

*Will be updated after the ReCon ;)
136

Final remarks
· I (Dennis) want to personally thank the "Studienstiftung des deutschen Volkes"(SDV) for their scholarship and support for my graduate study. Without them I probably would not have time to do this research.
· This research was not financed by Xiaomi nor any competitor. The research was founded by my private funds and was done in our free time.

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

137

ReCon BRX 2018 ­ Dennis Giese, Daniel Wegemer

138

