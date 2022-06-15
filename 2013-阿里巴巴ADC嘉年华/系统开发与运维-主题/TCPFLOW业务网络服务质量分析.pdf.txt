TCPFLOW
 


         

TCPFlow

TCPFlow

 

 Amazon:  100ms 1%

 Google: 400 ms  0.59%

 Yahoo!: 400ms  5-9%

 Bing: 2  4.3%/

 Shopzilla:  7 2  7-12% 25%



----IResearch

TCPFlow  TCPFlow VS 

NB/Gomez Aliprobe/UAQ js  TCPFlow

 

























 

TCPFlow
   http504 408 ...  rt
          tcpdump 

TCPFlow
    
    Facebook

TCPFlow  







TCPFlow ­   

TCPFlow ­ TCP  TCP

TCPFlow ­ HTTP  HTTP

TCPFlow ­  - InitCWnd

 InitCWnd: InitCWnd

initcwnd 6 8
10 12 14 16

rt(ms) 792 776 764 754 748 742

loss rate 6.37% 6.76% 7.13% 7.43% 7.71% 8.03%

rt

rt

loss rate

loss rate

900

0.09

800

0.08

700

0.07

600

0.06

500

0.05

400

rt 0.04

loss rate

300

0.03

200

0.02

100

0.01

0

0

6

8

10

12

14

16 initcwnd

6

8

10

12

14

16 initcwnd

TCPFlow ­  -   TCPFlow( t1 VS t0 )

TCPFlow ­  - http keep-alive  rt





TCPFlow -  ­   rt

HTTP 1370673260 778163 1370673310 190*******.1728 185*******.80 1 1 1257 265 211 1 GET /sub?nick=************************************************************** ********************************************************* 200 2 0 0 50000 50053 70 105 1 1 1 ****.taobao.com



rt

TCPFlow ­  ­ rtt  rttrt
HTTP 1370675470 28730 1370675475 826******.2300 185*******.80 1 2 1235 1132 512 1 GET /tbc?callback=********************************* 200 15 3950 2338 3511 1 2 1 ****.taobao.com
rt rtt

TCPFlow -  ­   http

HTTP 1370675628 483486 1370675641 192*******.15689 185*******.80 2 36 1582 50837 22825 1 GET /?spm=*********************** 200 38 19 19 10 36 13459 16 24 2 36 1 ****.taobao.com

 rt



TCPFlow ­  ­ DNS

 rt

 TCPFlowCity1 ISP 1 City2 ISP2 (3402525012. 55352<->200*******.80)

 City 2 ISP2 ISP 2

 rt

City2 ISP2

City 1 ISP 1

2s
1.8 1.6 1.4 1.2
1 0.8 0.6 0.4 0.2
0





 

TCPFlow -   

  

 tcpflow top 10

 



IP1

IP2

Bytes Ratio



172.30.38.22 172.20.130.78 4516416 0.074

172.30.38.14 172.20.135.6 4226218 0.069

172.22.5.178 172.20.142.4 3159775 0.052

172.30.38.22 172.20.132.31 1843042 0.030

172.16.198.130 172.20.130.68 1472316 0.024

10.228.90.25 172.20.233.1 1293990 0.021

172.30.38.23 172.20.130.78 1259080 0.021

172.16.198.130 172.20.130.65 1209308 0.020

TCPFlow ­   

TCPFlow ­     (proto, sip, sport, dip, dport)

TCPFlow ­   

TCPFlow ­  - 

SYN_SENT
ACKC

SYNS/ACKS

ESTAB

GETC

FINS_SENT
ACKC

ACKC FINS

SYN_RCVD
GET_RCVD
FINS
FINS_ACKED FINC_ACKED

SYNC

NEW

DATAS/ACKC

DATAS GETC
FINC ACKS

DATA_SENT
FINC
FINC_RCVD ACKS

TCPFlow ­  -   

1

2

Client

Server

Client

Server

SYN SYN_RCVD

SYN SYN_RCVD

SYN/ACK SYN_SENT

SYN/ACK SYN_SENT

ACK

RTT Connect Time

-RTT/2

ACK

Connect Time

ESTAB

ESTAB

TCPFlow ­  - http

Client

Server

GET1

GET_RCVD

ACK

Server Handle Time

DATA1 DATA2

DATA_SENT URI RT - RTT

Last DATA Last ACK

DATA_SENT

GET2 ACK DATA1 DATA2

GET_RCVD DATA_SENT

Last DATA Last ACK

DATA_SENT

TCPFlow ­   

TCPFlow ­ 

 serverclient  

   

RTT BY Client: RTT BY Server

A Server act as both Client & Server

Client

Server

SYN

RTT

SYN/ACK

RTT

ACK

TCPFlow ­ -RTGET

Client

Server

GET1 ACK DATA1 DATA2
Last DATA Last ACK

RT1 URI RT - RTT

Q1 RT 12
Q2 GET FIN

RT2 URI RT

GET2 ACK DATA1 DATA2

Last DATA Last ACK

TCPFlow ­  ­ GSOTSO

Client

Server

GET1 ACK DATA1 DATA2

InitCWnd = 10 seq:1

1 2 3 

seq:1461

GSOTSO 

DATA10 ACK2 DATA2

seq:13141 seq:1461

new_seq <= seq:1?

Last DATA Last ACK

TCPFlow ­ 
   VIP hash -> bitmap  state hash   sprintfinet_ntoa      state

TCPFlow
     


   @_ @ @RyanY_ @
@Cz@

Q&A

