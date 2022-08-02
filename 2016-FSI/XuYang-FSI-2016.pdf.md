IoT-Research On Security Of Video Surveillance System
NSFOCUS Xu Yang

Agenda
IoT & Video Surveillance System IoT & Botnet IoT Security Solutions

IoT & Video Surveillance System

Who

Who we're going to talk about

Why

How

Where

Why we research the camera How to do the Research Where are these cameras

Who ?
Who we're going to talk about

IoT

Home router

Smart home

printer

Surveillance cameras

Video Surveillance System
· DVRDigital video recorder · CCTVClosed-Circuit Television · Security Camera · Network Camera

Why ?
Why we research the Security Camera? Security Camera is really safety?

1. weak password

weak password of some DVRs

weak password built in mirai

2. vulnerability

3. OEM

4. backdoor

Open source firmware built-in backdoor

Get root privilege without password

5. poor awareness of safety

open telnet or ssh by
default

exposed the
camera to the
internet

no forcing users to
modify the default
password

Manufactu rer

actively ignore vulnerabilit
ies

Use the default passowrd

user

Without update firmware

6. Weak Position of The Security Department
When there is security event

live broadcast

IoT  BoT

How
How to do the research?

IoT Search Engine
search everything connected to the Internet

Sample Analysis
monitor the process netstat
capture the cmd between bot client and CC server
reverse the sample to get more useful information

Example ­ How to get 10k bots in 1 minutes
1. 1. capture the packet from the honeypotget the IP port and weak password
2. telnet and get the banner
3. search the same type devices on the IoT search Engine

Where
Where is the High-risk Security Camera 

GEO Distribution
Up to the end of September, We made a statistic on the global's high-risk Video Surveillance System, the number has execeed 2500,000.

Fingerprint Distribution
Part of the high-risk security camera fingerprint distribution

IoT & Botnet
Famous ddos Botnet attacks analysis review

make an introduce about the latest attacks launched by IoT
Analysis of the active botnets base on IoT

Famous DDoS attacks review

IoT-botnet attack against Krebs

Independent investigative journalist Brian Krebs public an article on krebsonsecurity.com about the vDoS services

After publishing the history about the vDoS, two 18-year-old men was
arrested

2016/09/21Krebs's
website came under a DDoS attack that peaked
at 620Gbps

620G

One week latergoogle
project shield provide free ddos protection service for the site

Akamai stop to provide service for free

IoT-botnet attack against OVH
1T

IoT-botnet attack against dyn
First
The First DDoS attack began at 7:00 a.m. (EDT) and was resolved by 9:20 a.m.
Second
A second attack was reported at 11:52 a.m. and Internet users began reporting difficulties accessing websites.
Third
A third attack began in the afternoon, after 4:00 p.m.At 6:11 p.m., Dyn reported that they had resolved the issue.

IoT Botnet Analysis

IoT-botnet character

· Embedded device and poor performance

limmit resoure
on a single bot

large scale

· Have the ability to launch 1T ddos. 100G, so easy

· Login and control the device at any time

7*24

no protect
· no security software like windows OS

IoT botnet
mirai

·Currently, the famous botnet

luabot

·A very complex trojan which coded in lua

luabot  mirai
·seize resource
mirai  other mirais

mirai-botnet
· Malwaremustdie public an report about mirai
2016.09.01
· Launch DDoS attacks against krebsonsecurit 2016.09.21 · Launch DDoS attacks against and OVH
2016.09.22
· The author open the mirai source code on github
2016.09.30
· take part in the biggest DDoS attack and take 2016.10.20 down half America

mirai-botnet

bot client

report server

attack server

botnet

role report server
attack cmd server bot client

function description gather the result, login the device and download the sample send cmd to the bot client
scanddos

report server

1. report the scan resultip/port/user/passwd

2. login the device and download the sample

attack server

mirai-bot
cross - platform:
random process name and each bot listen a fixed port to prevent multiple instrances of bot running together:

mirai-bot
rebind the 22 23 80 to prevent other malvares to control the devices
Built-in week password and encrypt strings

mirai scan module
scan character
1. scan port232323 2. scan the whole network expect some reserved IPs 3. SYN packetTCP_SEQ = DST_IP
send the result
(ip|port|user|passwd)
to the report server

mirai DDoS module

cmd type duration vector targs_len targets
opts_len opts

cmd lengthByte 4 1 1 targs_len
1 opts_len

description attack duration
attack type target count the targets to be attacked attack opts count attack opts

SYN ACK UDP

DDoS

HTTP DNS

GRE

IoT botnet
mirai

·Currently, the famous botnet

luabot

·A very complex trojan which coded in lua

luabot  mirai
·seize resource
mirai  other mirais

luabot
· malwaremustdie public a analysis report about luabotthe 2016.09.05 luabot author leave a contact email: luabot@yandex.ru

· A journalist make an interview with the author
Mid of September

· This bot has many varietiesactivity but don't make any big

now

event

luabot
· flexiblity

· the process name is : arm_lsb or arm_lsb_oabi

written in lua

process name is easy to recognize

rebind the port 22

muit-attack types and build in

23

javascript engine

· the aim is to prevent other malwares control the devices

· The attack can bypass the JS auth algorithm

luabot HTTP Flood ­ bypass CloudFlare

luabot

Web server

Get index.html
503 (javascript code) Parse the javascript code which built-in 503 page and get
the cookie
Get index.html (cookie: cf_clearance=xxxxx)

Get index.html

IoT botnet
mirai

·Currently, the famous botnet

luabot

·A very complex trojan which coded in lua

luabot  mirai
·seize resource
mirai  other mirais

luabot  mirai
luabot

mirai

luabot

mirai

luabot  mirai
luabot and mirai running together. Both of them have connected the mirai cc server

On the other device which running luabot,we can see it is a ddos

packets of the ddos attack against mirai

mirai  other mirais

    

    

ftp.xenonxxxxx.xyz hightxxxxxx..club

loaxxxxxure.pw

mirai  other mirais

IoT security situation analysis

Develop Trend of IoT

IoT became darling of the dark industry

Security Solution
Party A & B

Third party

others

Party A&B - victims Third party - security vendors Others - countryorganizations

Party A & B-victim

close telnet and ssh
services by default

check the vulnerability of the device and make penter test at regular
time

Manuf acturer

force the user to change the
default password

 


Change the default
password and do not use the
week password

update firmware and patch in time

users

do not expose the devices to
the public network

Third party-Security vendors
Strength cooperation with the IoT manufactures

Improve the protection capability of the security device or security services

Security vendors

Cloud protection
Reputation Cloud

Provide penetration test for the manufacture;
Report the IoT's vulnerabilities to the manufacture in time;
easy to attack but hard to defend, cost of the attack is low The current protection technology can not solve the advanced DDoS attack
For the large flowcloud protection will be the only choice It's hard to do real-time detection for some advance attacksso we need the data came from cloudNSFOCUS ADS can download mirai IP lists to do the filter

others-countryorganizations

THANKS 

