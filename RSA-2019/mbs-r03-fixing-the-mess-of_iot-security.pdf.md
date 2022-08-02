SESSION ID: MBS-R03
Fixing the mess of IoT security:
Sticking plaster over systemic flaws
Ken Munro
Partner Pen Test Partners @TheKenMunroShow
#RSAC

#RSAC
Who am I?
An IoT security researcher & penetration tester
Part of a team of >80 who carry out extensive research in to IoT, card payments, ATM & automotive security at @pentestpartners
Known for public research in to hacking vehicle security, Samsung smart TVs, smart fridges, smart kids toys and much more...
2

First, some tea...

#RSAC
A Wi-Fi tea kettle
A Wi-Fi enabled tea kettle, essential for every home
Comes with mobile app, from which kettle can be boiled
Offers stunning time saving, at a $100 premium over a regular nonsmart kettle
4

#RSAC
How to hack a kettle
READ THE MANUAL!
5

#RSAC
6

#RSAC
Disclosure
"It's OK" said the manufacturer ...the hack requires specialist knowledge and one would have to be very lucky to find a user with an iKettle
7

#RSAC
Wi-Fi is trackable
Find kettles with https://wigle.net
8

#RSAC
iKettle v3.0
Much more secure now. Why?
Because the vendor hired in-house security expertise and outsourced the back end platform provision
9

Stalking your children: IoT security issues become systemic The problems are accelerating

#RSAC

#RSAC
Insecure Direct Object References
Change the child's location
Set off geo-fencing alerts
Can also call the child
But worst, anyone can spy on the child silently
Systemic: affects around 3 million watches, multiple brands Same API

#RSAC
Another smart watch exposing systemic flaws
Icelandic data protection authority found issues in Enox smart watch, issued immediate ban and used EU RAPEX notification to highlight ban across Europe
We went back to our earlier research:
Enox watch uses API from thinkrace, Chinese ODM
Systemic: API connects to 7 million tracking devices, 367 different device types

Remote listening

I'm listening to your
child

#RSAC
**** You!

15

Hacking Cayla

Evil phone, modified app

No Bluetooth PIN

Voice recognition

#RSAC
Tamper with antiswearing process

MITM

Wikipedia API

Modify unencrypted data in transit

API call broken when Wikipedia enforced SSL!

Local Q database + `badwords'
16

Evil API

#RSAC
Vendor updates the app
Our attack stopped working a while back, after the application was finally updated They `fixed' it by encrypting the database contents with SQLcipher
Ignoring the issues that actually mattered
17

Smart vehicle security: More systemic flaws

Vehicle telematic service platforms - TSPs

#RSAC

Weak key exchange

Private APNs used for cellular communications with vehicle TCUs over TSPs

TCU in vehicle A
Can now hack vehicle B through TSP using
cracked private APN key

3G femtocell

We found the GSM authentication mechanism & found it to be surprisingly weak
The private APN key is hashed with MD5, as specified by RFC1994 (PPP CHAP), so keys <12 chars in length are trivially cracked

Some telematics service platforms had not Worse, can now hack vehicle C implemented vehicle-vehicle segregation
from another OEM, as TSP has
not implemented segregation OR EVEN OEM-OEM SEGREGATION

VPuethtinclgeytoeuler mTSaPtiecnsdeproviincteopnlathtefoprumbslic- TinStPersnet

#RSAC

Found last week
Major TSP left MQTT endpoint on the public internet
Discovered via shodan
Flagged & fixed very quickly

Putting your TSP endpoint on the public internet

#RSAC

Story breaks at 11pm tonight

Demonstrate how to hijack & steal ~3 million vehicles, worth ~$250Bn

Track you & your vehicles in real time

Unlock your car to order

And LISTEN silently to drivers conversations in ~2M vehicles

IoT security flaws are becoming systemic

Mirai v1 was systemic, did anyone realise?

#RSAC
What you thought Mirai v1 was An IoT botnet affecting 300,000 printers, cameras, VoIP phones exploited in 2016 Then used to DDoS DNS provider to Facebook, Twitter etc Except it wasn't

#RSAC
Mirai v1 was... ...a DVR botnet

#RSAC
How people missed that Mirai v1 was systemic
QVIS DVR
Mezory DVR Dreambox DVR/PVR Realtek DVR

http://wiki.xm030.com/

#RSAC

It was all one vendor of DVR firmware: XiongMai Makepack allowed ODMs to customize per-brand Including several code execution flaws that we found, never used by Mirai

Swann camera

#RSAC
Access anyone's video stream Fixed now, fortunately Authorisation flaws on the API Transpired to be a problem with back end provider, affected multiple brands and millions of cameras IoT security flaws are becoming systemic
27

Hacking your hot tub...

We pwned a smart hot tub for Xmas 2018

#RSAC
Did this really matter?
Yes
Why?
Back end service provision
Lack of authorisation didn't just affect hot tubs
It affects trucks, cars, medtech and more

Fixing this mess

#RSAC
Advice for IoT vendors
Systemic flaws arise from, for example
Lack of API authorisation (IDOR) Hard coded back doors Remote Code Execution Default credentials on published services Missing client segregation
31

#RSAC
Advice for IoT vendors
If you outsource your back end service provision, you need certainty that their security is robust
Marketing claims are no substitute for reality
"How do you verify & prove that users are correctly authorised?"
Work through the OWASP Top 10 if you like
32

Advice for businesses using IoT

#RSAC
Find out who looks after the security of your:

Building management system Door access controllers Gatelines CCTV Lift control system Industrial controls Room booking system

Smart TVs, media casters Drinks machines Fridges
If you don't ask for security, you won't get it

34

The stick

#RSAC
EU / ENISA
Some good progress in the EU
Good guidance & a move towards a certification framework
BUT, not mandatory & regulation perhaps not until 2023
36

#RSAC
UK IoT Security Code of Conduct
Has taken a different direction, which I support
Simple approach, to ensure basics are covered by IoT vendors
Whilst not mandatory, regulation is in discussion. Potential for 2020?
37

#RSAC
California State Bill 327
Cited My Friend Cayla
Makes reasonable security features mandatory from Jan 1 2020
Open to interpretation, but a huge step forward
38

#RSAC
Legal cases
Several products banned in Germany for telecommunications law violations
Several banned in other countries for DPA violations
Several class action suits for excessive data collection, in breach of vendors own terms!
39

If we don't address this now, systemic flaws will accelerate further

#RSAC
Thank you
@TheKenMunroShow @PenTestPartners LinkedIn: Ken Munro + cyber Blog: www.pentestpartners.com/blog/ Penetration testers of IT, OT, IoT, vehicles, planes, trains, ships and ATMs
41

