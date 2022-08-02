New Adventures in Spying 3G & 4G Users: Locate, Track, Monitor
Ravishankar Borgaonkar, Lucca Hirshi, Shinjo Park, Altaf Shaik, Andrew Martin and Jean-Pierre Seifert
BLACKHAT USA 2017 Las Vegas 26 July 2017

Research Team
· Discovery of attacks: · Ravishankar Borgaonkar · Lucca Hirschi
· Carried out POC with : Shinjo Park & Altaf Shaik
Page 2

Outline
· Background · New privacy attacks · Attacks in practice ­ exploitation methods and demo · Impact against mobile users · Countermeasures · Conclusions
Page 3

General cellular architecture

Radio Access Network

Core Network

Emerging threats
Page 4

Tracking mobile users ­ state of the art

Mobile

Base Station

MNO

Internet

Compromise mobile (Pegasus)

Stingray

Compromise MNO (Greek Scandal)

SS7 services (HLR Lookup)
Note: picture provides an abstract view only
Page 5

Tracking using Stingray/fake base station

Authentication Protocol Mobile with SIM
IMEI IMSI

Fake Base Station
2G 3G/4G

SIM ­ Subscriber Identity Module

IMEI ­ International Mobile Equipment Identity IMSI ­ International Mobile Subscriber Identity

Page 6

Authentication and Key Agreement (AKA) Protocol
· Deployed in every 3G/4G terminals since 2002 · Mutual authentication between network and mobile to establish a
secure link
· Improved in 4G ­ key sizes, key separation etc. · Often termed as one of the most successful widely deployed
crypto protocol
Features · Symmetric key shared between mobile (USIM) and network (HLR)
· Sequence number for avoiding replay attacks
Page 7

AKA : State of the art
· Known security issues
· IMSI leakage
· Linkability attacks
· Availability of low-cost hardware and software tools · New attacks??
Page 8

AKA : Big picture

Mobile

Base Station

IMSI Catchers

User Identification

Network

Failure Messages

Challenge

Authentication Material

Part of new attack vector

Re-Synchronization

Page 9

AKA protocol

K, SQN Mobile

RNC

MSC/VLR

AuC K, SQN

identity request : IMSI

authentication request IMSI

(RAND, AUTN (SQN AK, AMF, MAC))

XRES = f2(K,RAND) CK = f3(K, RAND) IK = f4(K, RAND) AK = f5(K, RAND) MAC = f1(K, RAND, SQN, AMF)

verify AUTN and compute RES

RES

XRES = f2(K,RAND) CK = f3(K, RAND) IK = f4(K, RAND) AK = f5(K, RAND) MAC = f1(K, RAND, SQN, AMF)
(RAND, AUTN(SQN AK, AMF, MAC), XRES, CK, IK)

if RES == XRES

session with encryption and Integrity keys if RES is different from XRES, re-synchronization procedure

Role of Sequence Number (SQN) in AKA
· SQN for providing freshness to mobile (prevent replay attacks) · Helps in saving one round trip message to AuC · AuC stores SQN and increment it for each authentication · Masked with anonymity key AK to protect privacy of mobiles · USIM stores highest received SQN from the network · In case of failure, resynchronisation of SQN with AuC
· USIM must send current SQN to AuC · Masked with anonymity key AK*
Page 11

Mobile SQN too high or low

Base Station

Network

Send current SQN to network

Page 12

Sequence Number SQN policies
According to guidelines from 3GPP TS 133.102, different policies for SQN and its update:
· SQN counter may be updated by 1 · SQN may be time-based
Most of our attacks work for any policies that are not time-based. Other Location attacks work independent of policy.
Page 13

New vulnerabilities and attacks
Page 14

First Attack Vector

Request of challenges are not authenticated
· Design choice of symmetric key mechanism · Seems no check at AuC (HLR) for such queries
Privacy impact
· Build a fake USIM by reprogramming IMSI · Collect RAND, AUTN pairs · Re-use them to locate a particular mobile users

User Identification Authentication Material
Challenge Re-Synchronization

Page 15

Exploiting first attack vector
How to find IMSI of a target
· HLR Lookup services · phone number à IMSI
Build a fake USIM card
· Reprogram IMSI · No other keys required · Collect RAND, AUTN pairs
Page 16

Location attacks against 3G/4G devices
RAND, AUTN
Location attacks
· Locate a targeted phone ( range of 2 km) · Track further using GPS or triangulation method
Page 17

Our Attacks
Activity monitoring attacks
· Learn n least significant bits of SQN ( and IND) · Learn whether mobile attached to certain network in a certain time window
Service usage (calls/SMS) à number of authentications à increase SQN Mobile's activity ­ new type of threat
Location attacks
· Track/trace a mobile in the radius of fake base station
Page 18

Proof of concept

Mobile

Stingray

Network

Page 20

Attacks & Demo
Page 20

Experimental setup
· Hardware
· USRP B210 · Any smartcard reader · Programmable USIM
· Software
· pySIM · OpenLTE
· Hardware setup costs about 1400$
Page 21

Putting attacks into practice
· Practical confirmation of all attacks in real networks · (Available) hardware setup cost : 1400 $ ( 100 $ for POC only) · Monitoring attack : 10 bits of SQN quickly ( 12 injections + 64
eavesdrops)
· Monitoring attack can be improved with more efficient signalling
setup
Page 22

Observations in deployed 3G/4G networks...1
Issue with a window of acceptable sequence number values to recover from loss or reordering
· No clear requirements in TS 33.102 (only guidelines) · Different policies about accepting unused AUTN, RAND pair · Risk to mutual authentication property of AKA
Page 23

Observations in deployed 3G/4G networks..2
No rate limit at which AKA tokens can be requested from HLR
· Tested in few European mobile operators · Assist in revealing SQN, bypass mutual authentication, and locate a
mobile phone
· Protection needed?
Page 24

Impacts against users & operators
End Users:
· New threat on privacy (activity monitoring attack) · New location attack, harder to detect, harder to fix · Affect all 3G and 4G devices · Likely to affect in 5G??
Cellular Operators:
· New attack interface to inject packets to HLR (heart of the network) · Poor SQN policies may introduce denial of service attacks · Problems in detecting modern IMSI catchers
Page 25

Countermeasures
Mobile Operators :
· Evaluate SQN acceptance policy · Rate limit authentication request at AuC/HLR?
End Users:
· Unfortunately, nothing much beside use WiFi services without USIM
Vendors:
· Hopefully fake base stations will no longer work in 5G · Support for legacy network (2G/3G/4G) challenging · More efforts in mobile OS to tackle fake base station problem
Page 26

Conclusions..1
Lessons :
· Trade-offs are still valid - almost 25 years · Mobile devices are still dumb terminals in the architecture · There are almost infinite ways to build smart 4G IMSI catchers
Our Findings:
· New attack vector leading to various privacy breaches · Activity monitoring attack leaking new type of information to attacker · Affect different variants of AKA : {EAP, EPS} AKA, HTTP digest AKA · Countermeasures require non-trivial dedicated modifications (for 5G) · Improved policies on SQN may assist in minimizing impact
Page 27

Conclusions..2
From 3GPP TR 33.899 V1.1.0 (2017-03) :
Study on the security aspects of the next generation system (5G)
Page 28

Thank You. Questions?
This work was partly supported by 5G-Ensure (grant agreement No. 671562 www.5Gensure.eu).
Page 29

