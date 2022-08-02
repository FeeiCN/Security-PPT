SESSION ID: SBX1-R10
What Happens During a Medical Device Attack

Mike Kijewski
CEO MedCrypt @mikekijewski

#RSAC

What's a Medical Device?
· Pacemaker · Surgical Robot · Vital Sign Monitor

What if a med device is hacked?
Patient data can be stolen Hospital network compromise Device functionality interrupted
3

What if a med device is hacked?
Patient data can be stolen (HIPAA Violation) Hospital network compromise (Hospital financial loss) Device Functionality interrupted (patient harm)
4

Attack Vector 1
Bluetooth Low Energy
#RSAC

What would happen?
False vitals -> wrong diagnosis Interrupted monitoring -> missing critical event False vitals -> tainted data analysis algorithm
7

Apply:
Don't rely solely on BLE security Don't rely solely on "proprietary protocol" If you're a manufacturer, consider data integrity checks If you're a hospital, ask if there are data integrity checks
8

Attack Vector 2
Man in the Middle
#RSAC

What would happen?
Too much radiation Not enough radiation Misplaced radiation dose Availability disruption -> patient relocation?
11

Apply:
Don't rely solely on perimeter security Don't rely solely on "Who would do this?" If you're a manufacturer, consider security by design If you're a hospital, ask if the device is secure by design
12

Other Attack Vectors
#RSAC

Other Attack Vectors
OS Vulnerability (e.g. XP) User Authentication (or lack there of) Remote software updates (no verification)
14

Apply: How to mitigate these vulns during design
Unique keys on each device / endpoint Encrypt stuff locally Sign stuff locally Verify signatures on data / commands before acting
15

MedCrypt: A tool
Install Guardian library in each application Provision keys Call API to access functions Monitor remotely
16

MedCrypt: A tool
17

Apply
If you're a manufacturer, design security features into V0.1
­ FDA: "Encrypt, Sign, Monitor"
If you're an HDO:
­ Let vendors know security by design is a feature ­ Segment devices from network ­ Patch OS
18

SESSION ID: SBX1-R10
Thank you
Mike Kijewski
CEO MedCrypt @mikekijewski

#RSAC

