SESSION ID: ECO-R04
You've Been Warned: iBeacons to Bring a Tsunami of Change to Data Security

Gabriel Kang
Managing Director CoSoSys Korea

#RSAC

#RSAC
Will iBeacon be the knight to find the Holy Grail?
2

#RSAC
Quick Overview of iBeaconsTM and BLE beacon

Since iOS7, Middle of Y2013
 Core Location monitors Bluetooth LE beacon signals
 Various hardware can be a beacon  Third party Bluetooth LE emitters  iOS devices
 Advantages  Accuracy and range awareness  One beacon ID can cover multiple locations

Since Android 4.3, with BLE 4.0  Nexus 4+  Nexus 7+ 2013  Samsung Galaxy S3+  Samsung Note 2+  HTC One  HTC Butterfly  etc

3

#RSAC
Potential of iBeaconTM and Other BLE Beacons:
 # of installed Beacons in South Korea (Source: etnews.com)  In Y2014 ­ Approximately 100,000 units installed  In Y2015 ­ Approximately 300,000 ~ 400,000 units (Estimated)
60 million units by 2019
Source: ABI Research
4

Coverage: GPS

iBeacon

#RSAC
NFC

5

#RSAC
Coverage: Location, Proximity and Touching

Tens of meters to hundreds meters

Tens of centimeters to several tens of meters

6

Contacting or a few centimeters

#RSAC
MDM vendor's expectation with iBeacon
7

#RSAC
The market dominator of MDM in Korea(?)
8

iBeacon Fencing

Beacon B to A

A

Outside

Camera On

 One iBeacon - Proximity  Two iBeacons - Direction  Three+ iBeacons - Location
Outside

#RSAC

B inside

Beacon A to B Inside
Camera Off

#RSAC
GeoFencing vs iBeacon Fencing
 Indoor or Underground  Very accurate without
location

#RSAC
In door location can improve safety
Your smart devices can lead you to get out of danger area safely when you get escape order
11

#RSAC
Only Secure Beacon gives CONTEXT data in trust!

Context

People

HW/SW tools

12

#RSAC
iBeacon Hijacking Protection

 It happens when an unauthorized user provisions the beacon with new configuration (UUID, Major, Minor)
 It leads to infrastructure theft
 Hijacking Protection - Each beacon has a Private Key - Mobile SDK simply relays encrypted messages - Server side Key Repository - AES-128 and MAC (Message Authentication Code) handshake

Push CFG

Key Repository (Beacon CMS)
2. Push Encrypted CFG
3. Push Encrypted CFG

1. Push CFG

13

#RSAC

iBeacon Spoofing Protection 1. Public UUID

 It happens when a fake beacon

Broadcast

impersonates the configuration of another beacon

5. Encrypted Token

BIV

 leads to fake notifications processing
 Beacon Identity Validation - Public beacon notification

6. Validate Encrypted Token & Encrypted ACK Token

7. ACK Token
4. Encrypted Token

Initiates a BIV - Mobile App initiates a security

8. ACK Token

10. ACK Beacon Identity
2. Validate Beacon Identity

handshake - Server Key Repository generates
security token and encrypts message - Beacon ACK the token - Server ACK beacon identity

Key Repository (Beacon CMS)
3. Generate & Encrypted Token 9. Validate ACK Token

14

#RSAC
SECURITY POLICIES based on location!
15

#RSAC
iBEACONTM in Business Environments
16

#RSAC
iBEACONTM in a store
17

#RSAC
iBEACONTM in Data Loss Prevention
 An additional factor of authentication
 policy enforcement - No Beacon, Lockdown mode
18

#RSAC
IBEACONTM in healthcare
19

#RSAC
IBEACONTM in education
20

#RSAC
21

#RSAC
iBEACONTM & BLE beacon in Data Loss Prevention
 Device Control Policy based on location
 Lockdown content on computers outside of organization
 Important data recognize who can access to
 Locating important data in the organization
 Imagine what can you do with context.
22

#RSAC
Will iBeacon be the knight to find the Holy Grail?
Gabriel.Kang@cososys.co.kr
23

