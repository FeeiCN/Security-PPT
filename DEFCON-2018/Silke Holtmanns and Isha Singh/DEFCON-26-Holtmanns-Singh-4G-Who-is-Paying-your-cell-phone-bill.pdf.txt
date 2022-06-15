Bell Labs
4G - Who is paying your cellular phone bill? Silke Holtmanns
Isha Singh Nokia Bell Labs

Bell Labs

1

<Change information classification in footer> © Nokia 2016

Bell Labs
Industrial Security Research?

Bell Labs

2

<Change information classification in footer> © Nokia 2016

Nokia Bell Labs ­ Future Attacks and Mitigation
Research that solves real problems together with our customers and sometimes even competitors
Bell Labs Research Lifecycle

· Theoretical studies go into attack and countermeasure design
· Validation and awareness of our research by GSMA standards input and publication
· Customer feedback and test results allow us to fine-tune and optimize our countermeasures
· Research input will fit product needs and operators requests
· Operator needs can be discovered "live" for new research challenges and disruptive new solutions

Problem study /

Lab

Threats/Attack

Design

Attack Testing

Customer Feedback Product Improvements

Counter measures

Validation and Awareness

Bell Labs
3

Bell Labs
You connect What does actually happen?

Bell Labs

4

<Change information classification in footer> © Nokia 2016

Roaming Why should you care?
You connected to AT&T, Verizon, T-Mobile, Sprint
DefCon participants CMCC, Airtel, MegaFon, Telenor
5

My colleagues, friends, family connected to DNA, Elisa, Telia
Source: DefCon, National GeoBgerlal Lpahbicss, Wikipedia

Connecting networks ­ The hidden private Internet The Interconnection Network (IPX)
Bell Labs
6

I switch on my phone
Las Vegas Antenna

Core Network

Authentication -> run to home network Checking subscriber
Core Network
7

Carrier / IPX Carrier / IPX
Bell Labs

Bell Labs
What is this secret network? Where does it come from?

Bell Labs

8

<Change information classification in footer> © Nokia 2016

The good auld history
1981 ­ Nordic Operator Meeting
Need to call my wife, she has birthday today. Stupid that I can not use my mobile.

The sauna is not hot enough. Lets connect the networks. So you call me and I can heat up the sauna before you arrive.

The beer is warm.... Should be longer in the fridge.

Bell Labs

9

<Change information classification in footer> © Nokia 2016

Source: Kauppalehti.fi / Erja Lempinen

Starting of practical discusions
We would need a cable under the water of the baltic sea...

Cold beer would be nicer. Yeah we should connect the networks.....then you can put it
before in the fridge in time.

Bell Labs

10

<Change information classification in footer> © Nokia 2016

Source: Kauppalehti.fi / Erja Lempinen

The technical Todwheenentdeatbwiylostrhkeswaerere worked out

governments anyway.

We don't need security. It is a

closed network

just for us

People will love it.

Pizza delivery

everywhere.

I know someone in ITU who can help

We could invite some other operators.
Some new protocol is needed for this.

Can you pass me another beer and the mustard?
11

Bell Labs
Source: Kauppalehti.fi / Erja Lempinen

Evolutions of IPX
· Started with 5 Nordic operators and calls only about 35 years ago
· Now about 2000 companies connected to it
- Mobile operators - Service providers (SMS aggregators, password recovery) - Satelite communication providers etc
· Very inhomogenous operator structure · Networks are a mix and match
- 2G, 2.5G, 3G, 4G and now 5G - Different hardware, protocols, products, releases - Many services voice, SMS, MMS, IMS, data, VoIP
· Network evolved, but security awareness only recently started (2014)
SMS providers
12

Bell Labs

SEP ­ Somebody Else Problem? Message for you.....
13

Bell Labs

It is not only you that is "reachable"
Bell Labs
14

Bell Labs
Security?

Bell Labs

15

<Change information classification in footer> © Nokia 2016

Who would hack this network

Bell Labs

Source: wired, the intercept, Verint skylock product description, vault.co, trace any

16

mobile, bankinfosecurity, the hill

Existing Attacks for the "old" SS7 Most of the attacks today are still SS7 ­ but things change

· Location Tracking · Eavesdropping · Fraud · Denial of Service user & network · Credential theft · Data session hijacking · Unblocking stolen phone · SMS interception · One time password theft and account
takeover for banks, Telegram, Facebook, Whatsapp, bitcoin wallet

17

Source: Security Week, The register, YouTube, wireless, wired, techworm

Bell Labs

How do attackers get in
Rent a Service
Kick in the door

Become an Operator Bribing and Employee

Hack via Internet
18

Social Engineering
Bell Labs

That is how they get in Well, of course there might be legitimate reason...maybe....
Some big Asian country
Bell Labs
19

New protocol New luck?

20

<Change information classification in footer> © Nokia 2016

Bell Labs Bell Labs

I switch on my phone
Las Vegas Antenna

Core Network

Checking subscriber: "Hey, does she have money, and what did he pay for" "Make sure it is really her"
Core Network
21

Carrier / IPX Carrier / IPX
Bell Labs

Network used for testing of attack

UE

eNB

22

HSS

MME

SGW

PGW
S9
PCRF
Bell Labs

Bell Labs
23

Operators with connected S9 billing interface

Operator A 24 Operator B

S 9

S9
IPX
Operator F

Operator D
Bell Labs

Network Architecture (3G/4G)

Here You Are...
25

eNB

HSS S6a

PCRF

S1 MME

Gx

S5

S11

SGW

PGW

INTERNET
Bell Labs

Bell Labs
26

Normal incoming request for roaming (Fin in US)

Home PCRF

S9
CCR CCA RAR RAA

Visited PCRF
Credit Control Request - Money? - What kind of service?
Re-Authentication Request - All kind of control and information - PCC management

Bell Labs
27

What is a "PCC"? Something you all have
· Policy Charging Control
- Defines everything about your subsription - Data type - Data rates - Whatever cellular service you can think off
· Defines how to handle you and what to grant you "service flow filters" · Usually identified by a string
· My own subscription is company paid and quite "generous"
- Perfect target for an attacker
28

Bell Labs

Diameter Routing Issue ­ Two Possibilities how to route.....Hop-by-Hop

Core Network

Request Orig: FakeFin Dest: US_NW Hop-by-hop ID: 3

Carrier

/

IPX

Request Orig:

FakeFin

Dest:

US_NW

Hop-by-hop

ID: 2

Carrier / IPX

Answer Orig: US_NW Hop-by-hop ID: 3

Answer Orig: US_NW Hop-by-hop ID: 2

Answer Orig: US_NW Hop-by-hop ID: 1

Core Network
Request Orig: FakeFin Dest: US_NW Hop-by-hop ID: 1
Attacker

Bell Labs
29

Bell Labs
Attack 1. Steal PCC of good subscription 2. Update cheap subscription with
PCC of good subscripion

Bell Labs

30

<Change information classification in footer> © Nokia 2016

Attack scenario against finnish operator ­ Request PCC via CCR

H-PCRF

Attacker

S9

V-PCRF

Message Format: <CC-Request> ::= < Diameter Header: 272, REQ, PXY >
< Session-Id >

CCR CCA

{ Origin-Host }

Credit Control Request - I have a customer, lets do
business

Diameter Edge Agent (DEA) { Origin-Realm }

Used operator

Bell Labs

31

{ Destination-Realm }

Requesting PCC via RAR (posing as home network)
Attacker

H-PCRF

S9

H-PCRF

RAR RAA

Re-Authentication Request (RAR) - IMSI
Re-Authentication Answer (RAA) - QoS-Rule-Install AVP

Bell Labs
32

Bell Labs
33

Bell Labs
34

Attack Scenario 1: Putting PCC via RAR (posing as home network)
Attacker

H-PCRF

S9

H-PCRF

RAR RAA

Re-Authentication Request - QoS-Rule-Install
Answer does not matter

Attack Scenario 2: Putting PCC via RAR to outgoing roamer
Attacker

V-PCRF

S9

H-PCRF

RAR RAA

Re-Authentication Request (RAR) - IMSI
Re-Authentication Answer (RAA) - QoS-Rule-Install AVP

Bell Labs
36

Bell Labs
37

Bell Labs
38

Before and After
39

Bell Labs

Impacts
· Attacker:
- Better services - Shifting the costs ­ Letting somebody else pay the phone bill - Re-selling "opportunity"
· Users:
- Might be billed for services he has not used (in particular company subscriptions are at risk)

· Operators:
- Bill disputes (service desks) - Loss of coporate customers - Costs with partners that can not be charged to a user
· IPX carriers still want to see their money
40

Bell Labs

Bell Labs
Countermeasures

Bell Labs

41

<Change information classification in footer> © Nokia 2016

Switch it off ­ build it from scratch?
Bell Labs
42

Countermeasures For Operators
· S9 Interface -> use IPSec with trusted partners directly
· S9 only open on need basis · Routing via origin realm, origin host · IMSI range ­ operator match · Check not to get messages from
yourself · Logical seperation of visitors and own
subscribers · Location distance · Fingerprint partner · Fingerprint "flows"
43

For "normal" Users
· Check your bill · Keep an eye on the news
For "corporate" Users
· Security and network protection is something that needs to be part of a Service Layer Agreement
· It is a quality indicator, similar to bandwith and coverage
Bell Labs

Bell Labs
Thanks to EU SCOTT Project for funding part of this research
Questions?
Silke.Holtmanns@nokia.com

Bell Labs

44

<Change information classification in footer> © Nokia 2016

