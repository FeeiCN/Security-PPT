The Awareness and Countermesures against IoT threat on the rise
October 2019, Singapore Kwangsik Lee

Contents
I Internet of Things II Internet of Threats III Insecurity of Things IV Internal of Threats V Immunity of Things

Internet of Things

HISTORY
daguerréotype

Film

First IP Camera

1839

1943

1951

1973

Colossus Mark 1

Internet

1996

Today
IoT

Internet of Threats
IoT Cyber Threat Trends

IP CAMERA CYBER THREAT
o Always connected to the Internet o Can be accessed by only knowing their IP address
o Webcams and IP cameras are more vulnerable than you think o Unsecured private IP cameras are easily exposed online

VULNERABLITIES IN IP CAMERA

BACKDOOR
- Log in to backdoor account with Telnet
AUTH
- Attackers can bypass authentication and download device configuration file

STREAMING
- Direct streaming of camera content
CLOUD
- Attack through cloud function that support device management

HOW TO HACK IP CAMERA

o Common attacks on IoT devices

-Use default passwords for administrator - Weak ID and PASSWORD cracking - Admin web page hacking

- Principle to find CCTV . Use unique URL by manufacturer
ex) inurl: /view/index.shtml . Broadband automatic scanning . IP tracking (email, sns, etc.)

Insecurity of Things

With default / weak id and password

random ip scan

upload devices url

default ID/PW access

Webcam Control

Exposed Video Streams

Internal of Threats

IPIPCAMERAHONEYNET (H/W)

traffic mirroring

Log Server

Elasticsearch Maria DB Python 3.0
Suricata Log Linux

Internet

Router

IPS

L4 Switch

TAP

Firewall

L3 Switch

IP Camera

IP CAMERA HONEYNET (S/W)

OS

LOGS PARSING

DB

MIGRATE VISUALIZE

IP CAMERA HONEYNET
 (NETWORK) Mirroring attack traffic using TAP equipment  (IP CAMERA) 10 Real machines best selling in Korea  (LOG SERVER) Real-Time Event Log Monitoring

IP CAMERA HONEYNET

ALIAS
IPCAM1 IPCAM2 IPCAM3 IPCAM4 IPCAM5 IPCAM6 IPCAM7 IPCAM8 IPCAM9 IPCAM10

MANUFACTURES CAMERA MODEL

EasyN

ES100G

EasyN

ES200G

Digitalzone WeVO CAM 200-FHD

NetTop C&C

SVR-700A

With&All

VSTARCAM-100T

NetTop C&C VSTARCAM-200A

PetsView

HD Camera

EzNet

NEXT-2200 FHD

EasyN

ES200K

AnyGATE

AnyCam-1100W

~IoT ( )  
ATTACK ANALYSIS - elasticsearch . 

path : /tmpfs/snap.jpg

accounts : user:user Source Country, IP, Port

ATTACK ANALYSIS - "command injection"
 FTP setup commands founded in URL

set_ftp.cgi By

injection to obtain root privileges, and

provide remote root Shell on the device

ATTACK ANALYSIS - "origins of attack"

Country CN BR KR US TW VN TR IL RU ID etc

Count Proportion

171

27.3%

68

10.8%

63

10.0%

41

6.5%

41

6.5%

22

3.5%

18

2.9%

13

2.1%

13

2.1%

12

1.9%

462

73.7%

180 171 135

90 68 63

45

41 41

22

18

13 13 12

0 CN BR KR US TW VN TR IL RU ID etc

ATTACK ANALYSIS - "origins of attack"

ATTACK ANALYSIS - "operating instructions"

3000 2250

2765

1500

750

0 Snapshot

Camera Control Snapshot etc
Zoom / Pan / Tilt FTP
Web UI Login Microphone Recording

Prop. 63.0% 11.0% 9.1% 8.7% 5.0% 3.2%

468

400

379

etc

Zoom / Pan / Tilt

FTP

217

138

Web UI Login Mic. Recording

~IoT ( )  
ATTACK ANALYSIS - "user agent"

Browser Mobile or Tablet
Python Agent Go lang Agent

user_agent in attack HTTP Header
Mozilla/4.0_( Mozilla/5.0_( Dalvik/2.1.0_( Dalvik/1.6.0_(
Python-urllib/2.7 python-requests/2.18.4 python-requests/2.19.1
Go-http-client/1.1

. 

Count Prop.(%)

69

94.5%

3 5.5%
1

IP CAMERA HONEYNET - "credentials"

Default Password

Default Access Password Count

IPCAM04

N/A

323

IPCAM10

N/A

188

IPCAM03

admin

78

IPCAM08

admin

33

IPCAM07

admin

32

IPCAM06 888888

3

IPCAM05 888888

2

vs Strong Password
Default User Access Password Password Count
IPCAM01 admin En8e0248 0
IPCAM02 admin En8c0442 0 IPCAM09 admin En8e0846 0

IP CAMERA HONEYNET - "survival days"

Days 50

41

41

41

38

30

25

15

13

10

7

5

5

4

0 CAM01 CAM02 CAM09 CAM04 CAM10 CAM07 CAM05 CAM06 CAM03 CAM08

"EXPE-R1IENCES" with IP Camera Honeynet
 Shorter survival days, not being able to access some IP cameras  When accessing via an abnormal path, camera control logs like
snapshot, zoom and pan&tilt are not left on device

2018
IP CAMERA HONEYNET

2019
IoT HONEYNET

first stages of IoT honeynet

still in development stage

~IoT ( )  
IOT HONEYNET - SYSTEM ARCHITECTURES . 

~IoT ( )  
IOT HONEYNET - IoT Virtualization techniques . 

connecting response

PROXY
caching

Cache Hit Rate :

Virtual IoT Device(with Caching Simulation)

IP / Port Scanning

IP /Port Return

Administrator Login Attempt

normal connection

error connection

IPCam Video Records

Video Recording

IPCam Zoom/Pan/Tilt Operating

Camera Operating

System Configuration modification

Network Settings

Wireless Setting

...

DNS Setting

Image Setting

Motion Detection

Sound Detection

Datatime Setting

98%

Real IoT Device IPCAM Type #01 IPCAM Type #02 IPCAM Type #03 IPCAM Type #04 IPCAM Type #05 IPCAM Type #06 IPCAM Type #07 IPCAM Type #08 IPCAM Type #09 IPCAM Type #10
2%

Immunity of Things

PROACTIVE RESPONSE FOR IoT THREAT

honeynet

crawler

We Will be a Global Leader in the Internet & Security Field
THANK YOU
kwangsik@kisa.or.kr

