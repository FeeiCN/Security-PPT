Taobao CDN
  
2010.8.27
2010
1


 Taobao--TFS Image ServerCache CDN  
2

CDN

L1-Cache

Cache Cluster

Global Load Balancing

Cache Cluster

Cache Cluster

Cache Cluster

~40T

L2-Cache Application Storage

Cache Cluster

Cache Cluster

Cache Cluster

~80T

Image Server Cluster

Image Server Cluster

~200 Servers

TFS Cluster

TFS Cluster

995T Used / 1800T Deployed
3


 Taobao--TFS Image ServerCache CDN  
4

2007

Upload Server

Admin Server

Image Server



SnapMirror

SnapMirror

SnapShot

FAS980C
A: Online Image B: Online Image

SnapShot

SnapShot

FAS980C
C: Online Image D: Online Image

SnapShot

 IDC

SnapVault 
NearStore R200 DR: A+B+C+D
2006  NetApp 980C/5R200  20TB 


· 
   
· 
     
  10T  
6

TFS 1.0
· 20076
 TFSTaobao File System1.0  200PC Server(146G*6 SAS 15K Raid5) :  : 140 TB : 50 TB IOPS 200+3MBps
7

TFS 1.0
8

TFS1.0
· Name ServerData Server 
· Data ServerLinux · block(64M
block) · block · ext3 · raid5 · TFS
 ­ 
9

TFS 1.3
· 20096
TFSTaobao File System1.3
· 2010.8.22
 440PC Server (300G*12 SAS 15K RPM) + 30PC Server (600G*12 SAS 15K RPM)
     1800 TB   995TB  Data ServerIOPS 900+15MB+  Name Server217MB

10

TFS1.3

Data

Application/Client
block id, file id/ allocate dataserver id (block id, file id)

Mysql Dup Store
filename crc,size refcount

NameServer

HA heartbeat NameServer

heartbeat message

control message heartbeat message

DataServer
dsp1 dsp2 dsp3

DataServer
dsp1 dsp2 dsp3

hda

hda

hda

hda

hda

hda

11

TFS1.3
· TFS1.3
           Name Server    
12

TFS
· TFS2.0
­ ­SSD/SAS/SATA
 ............
· TFS9TFS
13


 Taobao--TFS Image ServerCache CDN  
14


· 
­200Image ServerApache TFS
· 
­Image Server Cache TFS
· Image Server
­Cache ­ ­TFS


· Nginx
­NginxHTTP ­ ­
· GraphicsMagick
­ImageMagick
·  · LVS+Haproxy
Image Server


· TFS · 
­ ­
· 75% 94%
­CDN ­3070%


· 
­hash ­
· 
­Append ­FIFO
CacheImage Server TFS


 Taobao--TFS Image ServerCache CDN  
19

CDN
· CDN
­250T + 250T ­28617.45K ­8K61%11%
· CDN
­22(7) ­10G ­CDN220G ­119G

20

CDN
· 
­ ­
· CDN
­CDN ­CDN ­
 ­CDN ­CDN ­
21

CDN-

client
VIP1
NetScaler(7LB)

VIP2
NetScaler(7LB)

1

2  ...

n

squid

squid

squid

...

squid



22

CDN-

client

VIP1

LVS(L4)



VIP2
LVS (L4)

Haproxy(L7)

haproxy(L7)

Haproxy(L7)



squid

squid

squid

...

squid



23

CDN

 \  
  
  

 
     

       

·128squidsquid 2% ·VIP100G 
·Hash 1/(n+1)

Squid
· COSSTCOSSFIFO 1T
· SquidSquid 1250Mmemory cache
· sendfilepage cache
· SSDDIRECT_IO SAS/SATApage cache
· SquidSSD+SAS+SATA GDSF
25

1

· SSDSAS SATA
· SSD + 4 * SAS + SATA

[root@cache161 ~]# iostat -x -k 60 | egrep -v -e "sd.[1-9]" ... avg-cpu: %user %nice %system %iowait %steal %idle
3.15 0.00 5.63 11.35 0.00 79.87

Device: sda sdb sdc sdd sde sdf

rrqm/s wrqm/s r/s w/s rkB/s wkB/s avgrq-sz avgqu-sz await svctm %util 15.40 1.17 50.66 2.63 2673.22 124.85 105.01 0.55 10.39 6.27 33.41 0.07 0.03 447.29 1.02 4359.01 191.90 20.30 0.32 0.71 0.27 12.13 5.73 1.53 114.93 8.42 1264.86 100.58 22.14 1.05 8.48 3.56 43.94 5.57 2.07 121.83 9.57 1319.45 104.12 21.67 1.19 9.02 3.63 47.72 5.53 1.45 111.45 8.52 1246.53 101.92 22.48 0.95 7.88 3.42 41.06 5.45 2.02 118.93 8.00 1281.92 106.25 21.87 1.19 9.37 3.74 47.44

SATASSDSAS 4SASSSD
26

2

· SSD SASSATA
· SSD + 4 * SAS + SATA

[root@cache161 ~]# iostat -x -k 60 | egrep -v -e "sd.[1-9]" ... avg-cpu: %user %nice %system %iowait %steal %idle
3.15 0.00 5.63 11.35 0.00 79.87

Device: sda sdb sdc sdd sde sdf

rrqm/s wrqm/s r/s w/s rkB/s wkB/s avgrq-sz avgqu-sz await svctm %util 5.08 1.65 18.55 2.52 1210.07 119.00 126.18 0.14 6.50 5.46 11.51 1.68 0.05 610.53 1.75 6962.29 413.47 24.09 0.28 0.46 0.23 14.25 0.22 0.03 28.87 0.97 1172.93 189.13 91.31 0.16 5.28 4.40 13.13 0.23 0.02 29.70 0.77 1133.47 122.53 82.45 0.15 4.99 4.39 13.37 0.18 0.03 28.23 1.03 1078.73 206.27 87.81 0.15 5.00 4.24 12.40 0.10 0.02 28.42 0.55 1090.27 115.00 83.22 0.15 5.04 4.44 12.86

SATASSDSAS SSD4SAS5SASSATA 
27

1
· 32 DELL R710 · 2 LVS + 32 Haproxy + 64 Squid · 1221 · 10.58 Gbps · 15Gbps · R710500Mbps · squidobject1800 · Cache97% · Cache97% · 
28

2
· 30 DELL PowerEdge 2950 · 2 LVS + 30 Haproxy + 60 Squid · 20105 · 12Gbps · 2950400Mbps · 160G SSD + 143G SAS * 4 + 1T SATA · squidobject3000 · Cache97.5% · Cache97.5% · 
29

CDN
· CDN
­CDN ­ ­ ­GTM ­CDNCDN
· CDN
­" "
­
30


 Taobao--TFS Image ServerCache CDN  
31


· 
­CPUIntel ATOM, VIA Nano ­ChipsetSSDSATA ­GPUUSB Controller
· CPUI/O
­CDN Cache Servermemory cache Web Server
· 
­ ­()I/O ­
32

:

LVS

LVS






Internet

6Gbps

Rack

(6Gbps):

42U

5U  1U 
5U  1U 
5U  1U 
5U  1U 

40U


 Taobao--TFS Image ServerCache CDN  
35


·  · 
 ·  · 
 · 

36


37


· Code.taobao.org  
·  · Key/Value Cache/Store - TAIR · 
­TFS9 ­WebX v3.010
·  
38


Q & A !
39

