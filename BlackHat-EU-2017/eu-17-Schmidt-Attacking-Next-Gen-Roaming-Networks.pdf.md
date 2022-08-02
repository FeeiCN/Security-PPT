Attacking NextGen Roaming Networks
1

Agenda
o o o
2

What is SS7?
o
o
o o o o
3

The Most Simple Situation:
Alice has a contract with Provider A
Bob has a contract with Provider B

Alice Provider A

Provider B Roaming Network

Bob
Provider C
4

The roaming situation:
Alice has a contract with Provider A
Bob has a contract with Provider B
Alice is connected to Network of Provider C

Provider A

Bob Provider B Roaming Network
Provider C Alice
5

The roaming situation:
Alice has a contract with Provider A
Bob has a contract with Provider B
Alice is connected to Network of Provider C

Bob Provider B
Roaming Network

Provider A

Interaction with Provider of Alice

Alice

Provider C
6

Typical Roaming Interaction
o o o o
7

SS7 Weaknesses
o
o
o o o
8

Vulnerability Classification
o
o o
o
Source: SANS Institute - The Fall of SS7 How Can the Critical Security Controls Help?
9

SS7-MAP Message Classification
10

Tool
o
o o
o o o
11

12

Roaming in 4G/LTE Networks
o
o o o o
13

Diameter Networks
o o o o
14

LTE Roaming
Diameter IPX
SIP & RTP Provider A

Provider B
15

Method 1: Home Routed IMS

Provider A

IPX

Provider C

OCS DEA

DRA

DEA

DRA MME
HSS

DRA

DRA

MME PCRF

PGW IMS

SGW

Alice
16

Method 2: Local Breakout

Provider A

IPX

Provider C

OCS DEA

DRA

DEA

DRA MME
HSS

DRA

DRA

MME
PCRF IMS

SGW/PGW

Alice

IMS

17

Some Diameter Interfaces
o o o o o o o o
18

Diameter ­ The Base Protocol

Source: RFC 6733

19

Which application is used? (S6a, Sh, ...) Used to match answer with response Host which is initiating the request
Realm which is initiating the request 20

Diameter Messages (S6a)
o o o o o o o o
21

22

Let`s do some Attacker Modeling
o
o o o o
o
o o o o
23

Tracking
o o
24

Interception Attacks
o o o
25

Message/Call Interception
o
o
o
o
o o

o
26

Fraud
o
o
o 27

Denial of Service
o o
28

Limitations
o o
29

Summary (aka. let there be attacks)
30

Topology & Topology Hiding
o
o
o o
 

31

Spoofing? Yes!
o
o
 
32

Cross-Checking of PLMNs and Identities
o
o o o
33

Tool!
o
o o o
o
34

Tool (cont.)
o o
o
35

Tool (cont.)
o o
36

diameter_enum config file
[DEFAULT] origin-host: vanir origin-realm: vanir destination-host: fd.ernw.net destination-realm: fd.ernw.net host-ip-address: 10.11.12.1 vendor-id: 0 product-name: denum inband-security-id: 0
mnc: 001 mcc: 001 imsi: 0010012345678 plmnid: 12f345 msisdn: 12345678 imei: 9876543210
37

LIVE DEMO!
o
38

Penetration Testing of Interconnect Technologies
o
o o
o o
39

What's in There / Recommendations
o o o o o o
o o o
o o
40

Controls from Our Perspective
o
o o o
o
41

Summary & Outlook
o o
o
o o
42

There's never enough time...

THANK YOU...
@Enno_Insinuator erey@ernw.de

...for yours!
43

Thank you!
44

Sources
o
45

