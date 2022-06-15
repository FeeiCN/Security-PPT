Pomelo
 

·  ·  · 



·  ·  · 




· / ·  · 


·  ·  ·  ·  · 


1 Google  2. 3. 
 () () 



Pomelo
https://github.com/NetEase/pomelo
· Fast, scalable, distributed game server framework in node.js
· Open sourced in 2012.11.20

AMQP
Receiver Receiver



Receiver publish
Receiver

APNS publisher APNS publisher

Storage

Channel push, socket

Connector

Connector

Connector

push

socket.io Web client

lvs
mqtt
Android client

mqtt iOS client


·  ·  ·  ·  ·  ·  ·  ....................................



socket

socket

socket


·  1.  2. pomelo add host=[host] port=[port] id=[id]
serverType=[serverType]



frontend frontend

backend backend backend

master backend

·  ·  · P2P · 





handler

before

after

filter

websocket

remote session dispatcher rpc



user extensions

proxy

rpc invoke

rpc msg, opts

router serverId, rpc msg

serverId, rpc msg

mailbox

mailbox ... mailbox

mailstation

remote server

P2P
·  1. QOS 2.  3. 


· Broadcast --->scheduler---->channel
1. 
2. scheduler 300k 10 10k/200 CPU 50%~60%
3.channel 


1. android----mqtt 2. iOS ----mqttapns 3. PC &Web----websocket(socket.io)


Android : wifi 1~302G/3G 0.5~30
double : : : :



· Android

APK1 SDK
APK2 SDK

MQTT 
Push Service

 


· iOS : apns : :


· web
Websocket:  (IE, chrome, firefox)  :/ 

· 
server
monitor
server
monitor



master

admin server

admin console
admin console


·  ·  ·  · 

·  ·  · 





agent

master

web tools
agent

robot

robot

robot

robot

robot


· 
­ 612  (MAX:300K) ­ 200 ­ : 600M1.3G (MAX:3G) ­ CPU210% ­ 1S AWS







·  ·  · 


·  ·  · 

·  ·  · 



Thanks!

