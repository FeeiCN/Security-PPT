Hacking BLE Bicycle Locks for Fun & A Small Profit

1

whoami
· From Sunny Singapore · Senior Security Consultant @ MWR · Mobile and Wireless geek
­ BlackHat USA 2016 ­ Bad for Enterprise: Attacking BYOD Enterprise Mobile Security Solutions
2

Overview

1

2

Bike-Sharing Economy and the BLE "Smart" Lock

Analyzing Communications

3

Building a Master Key

Demo
4
3

Major Players

Major Players

Country Founded Operations
Cost

China

China

Singapore

2014

2015

2017

20 Countries 16 Countries 22 Countries

SGD$0.50/30min

6

Bluetooth Low Energy
Generic Access Profile (GAP)
· Peripheral Small low powered device e.g. bicycle lock
· Central High powered computing device e.g. Mobile Phone

Bluetooth Low Energy
Generic Attribute Profile (GATT)
· Services
Groups of Characteristics 16/128-bit UUID
· Characteristics
A single data point 16/128-bit UUID
8

Major Components
9

Personal BLE Bicycle Lock

Lock Decomposition

Logic Controller /
BLE

Motor to release lock

Notch
Spring Mechanism

Pin Notch

Noke Lock Services and Characteristics

Ubertooth One ­ Wireshark Capture

Major Components
19

iOS CoreBluetooth
CBPeripheral
· Remote peripheral devices that the app has discovered advertising or is currently connected to.
· -m "*[CBPeripheral readValue*]" · -m "*[CBPeripheral writeValue*]" · -m "*[CBPeripheral setNotifyValue*]"
CBPeripheralDelegate
· Provides methods called on events relating to discovery, exploration, and interaction with a remote peripheral.
· -m "*[* *didUpdateNotificationStateForCharacteristic*]" · -m "*[* *didUpdateValueForCharacteristic*]"
20

Summary...

Scan QR Code
01

02 Get Lock Key From Server

03

Server Responds with Lock Key

04 Request Encrypted Token

Gets Encrypted Token
05

06 Decrypt Token & Unlock!

oBike
22

oBike Lock
oBike lock teardown and rebuild, dockless share bike rescue: https://youtu.be/Vl3Gl8w8n-Q

24

http://www.o.bike/download 01 /app.html?m=065002064

02 App Checks Lock Status. Uploads Coordinates.

03

Server Responds with Lock Status

04 App Requests Key Source

05

App Gets Key Source

06 Request Unlock Key

07

Server Responds with Unlock Key

08 Unlock Bike Lock

HTTP Message Encryption

POST /api/v2/bike/060511449/lockNo HTTP/1.1 Host: mobile.o.bike Content-Type: application/json version: 3.2.4 Authorization: Bearer *****
{"value":"68693cfa10579681d81837350843342d9 9f0ba4373f9926c53c1f1c88576304d0b936e700388 8288fe949e73eb1d3267b713d2b261829ee04985234 23d6965db28e8b99854bf2adf592e51fb9da3b77068 f647b29caa5f22473ad01ec1011270a9d3a73100292 b0fdf331b17b37564556df790a58489d8cad3f4dd27 6d5ae68a95fc7effefc998de151eeb0983ddc721634 5e7682df8cf2de0d2cbf3a8b7e7c1c8f8604016c377 b0195b0ab9e83c604d"}

POST /api/v2/bike/unlockPass HTTP/1.1 Host: mobile.o.bike Content-Type: application/json version: 3.2.4 Authorization: Bearer *****
{"value":"aa47e49f01cc740fdaa87973966 799f94bf02ced7416b15f1cc7f63bf52f50f9 28e76c5d7f911a054188751f7243d68daef4b 69b22432ec2166dc823f29de811e21f4adbfd b826748b9e2573912422b0a51f6a07a5c7be2 bf7d41b56d69945c3ecf3ec94444db5abb26b 8c771fe8eba91cb1a5d336cc2130bde9bcb25 350250bb92c5aa880b2e6c0b3c0004c11ab0f 14eb1182b78fb3dcb5eb68e61205ae5048"}

HTTP Message Encryption - AES

9386 ms

| | +[OBikeEncrypt aesEncryptString:{"deviceId":"1521828969000-

8035385","dateTime":"1521984609867.631836","longitude":103.8331503422035,"latitude":1.38163138646

7611}&58bc93f4ac249b829174520a5afe733503f371f8]

9388 ms

| | | +[OBikeEncrypt aesEncryptData:<7b226465 76696365 4964223a 22313532

31383238 39363930 30302d38 30333533 3835222c 22646174 6554696d 65223a22 31353231 39383436

30393836 372e3633 31383336 222c226c 6f6e6769 74756465 223a3130 332e3833 33313530 33343232

3033352c 226c6174 69747564 65223a31 2e333831 36333133 38363436 37363131 7d263538 62633933

66346163 32343962 38323931 37343532 30613561 66653733 33353033 66333731 6638> keyData:<6f42694f

534d5946 557a4c65 64333234>]

keyData:<6f42694f 534d5946 557a4c65 64333234> = oBiOSMYFUzLed324

AES Key

oBiOSMYFUzLed

324

27

HTTP Message Encryption ­ SHA1Sum
POST /api/v2/bike/unlockPass HTTP/1.1 Host: mobile.o.bike Content-Type: application/json version: 3.2.4
{ "bikeId":"060511449", "deviceId":"1521828969000-8035385", "dateTime":"1521984617263.854980", "keySource":"c4f1dc24"
}&ad6dad370f01782adfe200584ff63be31af29069

{ "bikeId":"060511449", "deviceId":"1521828969000-8035385", "dateTime":"1521984617263.854980", "keySource":"c4f1dc24"
}&

oBiOSX4buhBMG

324
28

http://www.o.bike/download 01 /app.html?m=065002064
02 App Checks Lock Status. Uploads Coordinates.
POST /api/v2/bike/060511449/lockNo HTTP/1.1 Host: mobile.o.bike Content-Type: application/json version: 3.2.4
{ "deviceId":"1521828969000-8035385", "dateTime":"1521984609867.631836", "longitude":103.8XXXXXXXX, "latitude":1.3XXXXXXXX
}&58bc93f4ac249b829174520a5afe73

03

Server Responds with Lock Status

HTTP/1.1 200 Content-Type: application/json;charset=UTF-8 Connection: close Vary: Accept-Encoding Content-Length: 93
{"data": {"lockNo":"639BADF22", "lockType":2, "faultBike":false},
"success":true,"errorCode":100}

04 App Requests Key Source
16504 ms -[BluetoothManager peripheral:0x1742f6080 didDiscoverCharacteristicsForService:0x17667cb00 error:0x0] 16506 ms | -[CBPeripheral setNotifyValue:0x1 forCharacteristic:
<CBCharacteristic: 0x1704ae100, UUID = FFF6, properties = 0x16, value = (null), notifying = NO>]
16515 ms | -[OBikeBluetoothManager BLEDidNotify] 16519 ms | | | | | | -[CBPeripheral writeValue:0x17483f980 forCharacteristic:0x1704ae100 type:0x1] 16519 ms | | | | | | writeValue -> _NSInlineData 16519 ms | | | | | | forCharacteristic -> CBCharacteristic

05

App Gets Key Source

16518 ms | | | | | +[BluetoothSendMessage sendRentBikeInstructionWithCBPeripheral:0x1742f6080 CBCharacteristic:0x1704ae100 Longti:0x0 Lat:0x0]
16519 ms | | | | | | +[BluetoothSendMessage setValueForRentBike:0x0 Lat:0x0] 16519 ms | | | | | | -[CBPeripheral writeValue:0x17483f980 forCharacteristic:0x1704ae100 type:0x1] 16519 ms | | | | | | writeValue -> _NSInlineData 16519 ms | | | | | | forCharacteristic -> CBCharacteristic 16774 ms -[BluetoothManager peripheral:0x1742f6080 didUpdateValueForCharacteristic:0x1704ae100 error:0x0] 16775 ms | | -[HandleBluetoothMessage checkBlueToothDataWith:0x170824b40] 16775 ms | | | +[BluetoothSendMessage GetBcc:0x170013ab0 size:0xc] 16781 ms | | -[OBikeBluetoothManager BLEGetBike:0x17045fec0] 16783 ms | | | +[OBikeEncrypt aesEncryptString:{"bikeId":"060511449","deviceId":"XXXXXXXXXX",
"dateTime":"1521984617263.854980","keySource":"c4f1dc24"} &ad6dad370f01782adfe200584ff63be31af29069]

06 Request Unlock Key
07

Server Responds with Unlock Key

POST /api/v2/bike/unlockPass HTTP/1.1 Host: mobile.o.bike Content-Type: application/json version: 3.2.4

HTTP/1.1 200 Content-Type: application/json;charset=UTF-8 Connection: close Vary: Accept-EncodingContent-Length: 130

{ "bikeId":"060511449", "deviceId":"1521828969000-8035385", "dateTime":"1521984617263.854980", "keySource":"c4f1dc24"
}&ad6dad370f01782adfe200584ff63be31af29069

{"data":{ "encryptionKey":180, "keys":"8be1be17d41e8fdff1ae1c82e4500fec", "serverTime":1521984619298
},"success":true,"errorCode":100}

08 Unlock Bike Lock
19106 ms -[OBikeBluetoothManager openLock:0xb000000000000b43 keys:0x1718648c0 serverTime:0xb0001625d5a43223] 19107 ms | | -[BluetoothManager openLock:0xa383430343937327 Time:0x170440690 Key:0x1718648c0 encryptionKey:0xb4] 19108 ms | | | | | +[BluetoothSendMessage setValueForUnlock:1521984619.298000 Index:0xb4
Phone:0xa383430343937327 Key:8be1be17d41e8fdff1ae1c82e4500fec] 19113 ms | | | | | | +[BluetoothSendMessage ToHex:0x5ab7a46b] 19114 ms | | | | | | +[BluetoothSendMessage dataFromHexString:0x174a48550] 19114 ms | | | | | | +[BluetoothSendMessage dataFromHexString:0x174a28da0] 19114 ms | | | | | | +[BluetoothSendMessage GetBcc:0x174a45fd0 size:0x19] 19117 ms | | | | | | +[BluetoothSendMessage GetBcc] retval: 0xff 19118 ms | | | | | -[CBPeripheral writeValue:0x174a54340 forCharacteristic:0x1704ae100 type:0x1] 19118 ms | | | | | writeValue -> NSConcreteMutableData 19118 ms | | | | | forCharacteristic -> CBCharacteristic 19127 ms | | | | | -[CBPeripheral writeValue:0x174a53ef0 forCharacteristic:0x1704ae100 type:0x1] 19127 ms | | | | | writeValue -> NSConcreteMutableData 19127 ms | | | | | forCharacteristic -> CBCharacteristic

Unlock Algorithm

+[BluetoothSendMessage setValueForUnlock:1521984619.298000

Index:0xb4

Phone:0xa383430343937327

Message 1

Key:8be1be17d41e8fdff1ae1c82e4500fec]

???

Message Length

Command

67 74

18

82

Key Index b4

??? 00 00 02 79 40 48

Date Time 00 6b a4 b7 5a

Message 2

AES Key (Truncated)

BCC

8b e1 be 17 d4 1e 8f df f1 ae 1c 82

ff

BCC Calculation:
for i in bytearr { x ^= i
} return x
bytearr = Command ... AES Key

oBike Demo
36

MoBike
38

http://www.mobike.com/down load/app.html?b=AXXXXXXX
01

02 App Checks Lock Status. Uploads Coordinates.

03

Server Responds with Lock Status

Server Responds with Unlock Key
04

05 Unlock Bike Lock

HTTP Message Integrity Check
POST /api/v2/rentmgr/unlockBike.do?sign=b9441790c2e3c42a57b439b51995f546 HTTP/1.1 Host: app.mobike.com time: 1530100847000 mobileNo: +6512345678 accesstoken: XXXXXXXXXXXXXXXX platform: 0 Content-Type: application/x-www-form-urlencoded Connection: close Content-Length: 445
accesstoken=XXXXXXXXXXXXXXXX&bikecode=A0000XXXXX&biketype=0&btEnabled=1&channel=1&clie nt_id=ios&epdata=Es7dCTkXiZ1IV3H6z%2BS9R%2BYzRjFby0T4ADUNKh0aXm6wfZzfJtQEQ5IC%2By5lZYG KFVy8I9vP6wwvkKCEqxNSMMCM3WespduyU8Svj7qyadFV4pN/nbC1behZa7ew3V0G8ofy6udhTkjbWLcjWeWvi oJwrELB24aALccUKxCoMds%3D&latitude=1.3XXX&longitude=103.8XXX&mobileNo=+6512345678&time =1530100847000&timestamp=1530100847.123456&userid=XXXXXXXXX
41

HTTP Message Encryption
30714 ms | +[RSA encryptString:XXXXXXXXXXuseridXXXXXXX#1530031691.737942 publicKey:MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDCi/VezJp6KaJNXZCHpQ4YmKxlWrcrddow5pHDX3vHeiUqdOoJZJoBp UvFuFdlWEqP7itWNcPnuYAqRwXkh6xWD1oM4MrK4eH8/AzdGIgrcgq+pbB3DymgEujkHBhrxXqFiUS2OjfebKwU0xJTPQM/KcxjqGDZ xzswOxFJDxyKcwIDAQAB] enter mbk_lowercaseMd5 -> accesstoken=XXXXXXXXXX&bikecode=A0000XXXXX&biketype=0&btEnabled=1&channel=1&client_id=ios&epdata=Es7dCT kXiZ1IV3H6z+S9R+YzRjFby0T4ADUNKh0aXm6wfZzfJtQEQ5IC+y5lZYGKFVy8I9vP6wwvkKCEqxNSMMCM3WespduyU8Svj7qyadFV4 pN/nbC1behZa7ew3V0G8ofy6udhTkjbWLcjWeWvioJwrELB24aALccUKxCoMds=&latitude=1.381585998461937&longitude=10 3.8330852148159&mobileNo=+65XXXXXXXX&time=1530031691000&timestamp=1530031691.737942&userid=XXXXXXXXX@io ssecret leave mbk_lowercaseMd5 -> b9441790c2e3c42a57b439b51995f546
42

http://www.o.bike/download 01 /app.html?m=065002064
02 App Checks Lock Status. Uploads Coordinates.
POST /api/v2/rentmgr/unlockBike.do?sign=9623f419340536f95c31 4d81c4c2b548 HTTP/1.1
bikecode=A0000XXXXX&biketype=0&btEnabled=1&channel=1&cl ient_id=ios&epdata=ML1G%2BNjHnhzQPMoRZwtBx5k3c0yOBpBFZK ePvb3WsR0%2BWBvtT7saxcwIwbI6JAkG27HGjWKMGjeCwUyvw1zOgOA 17Lybmbv30ltfBwUkeFmpgklpG2YMEgFEEdCjYxhskfMtoLKWCz3WFB riiZ5S6yHnH5aT1yKe/YB7mMo1f0U%3D&latitude=1.3XXX&longit ude=103.8XXXX&timestamp=1530096030.920647&userid=XXXXX

03
04 Faulty

Server Responds with Lock Status Server Responds with Unlock Key
Good

HTTP/1.1 200 Content-Type: application/json;charset=UTF-8 Connection: close {
"bikeHardwareType": 2, "bikeId": "AXXXXXXX", ... "message": "Our apologies, this bike needs maintenance, please use another one", ... }

HTTP/1.1 200 Content-Type: application/json;charset=UTF-8
Connection: close
{ "bikeHardwareType": 2, "bikeId": "AXXXXXXX",
... "object": { "authkey": "", "data":
"001BB441CB88B4034565E1C7BE448CD4B3D9F5CAA8452A2323 5201",
"orderid": "MBKA0000XXXXXXXX", ...

05 Unlock Bike Lock
32484 ms -[MBKUnlockBikeData setData:001BB441CB88B4034565E1C7BE448CD4B3D9F5CAA8452A23235201]

35446 ms -[MBKPeripheral peripheral:<CBPeripheral: 0x1744ee380, identifier = 2B7D32FB-8B34-4C58-BB57A37976F63FC3, name = mobike, state = connected> didDiscoverCharacteristicsForService:<CBService: 0x172679c80, isPrimary = YES, UUID = A000FAA0-0047-005A-0052-6D6F62696B65> error:0x0]

35449 ms

| -[CBPeripheral setNotifyValue:0x1 forCharacteristic:<CBCharacteristic: 0x174aa45c0, UUID

= A000FEE1-0047-005A-0052-6D6F62696B65, properties = 0x10, value = <31>, notifying = NO>]

35452 ms

| -[CBPeripheral setNotifyValue:0x1 forCharacteristic:<CBCharacteristic: 0x174aa46e0, UUID

= A000FEE0-0047-005A-0052-6D6F62696B65, properties = 0x8, value = <33324634 46454444 37363546 38453530

46324232>, notifying = NO>]

05 Unlock Bike Lock

35591 ms 35592 ms 35592 ms 35592 ms

| -[MBKPeripheral writeString:30001BB441CB88B40345] | | -[CBPeripheral writeValue:0x17525e1b0 forCharacteristic:0x174aa46e0 type:0x0] | | writeValue -> _NSInlineData | | forCharacteristic -> CBCharacteristic

05 Unlock Bike Lock

35666 ms 35667 ms 35667 ms 35667 ms

| -[MBKPeripheral writeString:3165E1C7BE448CD4B3D9] | | -[CBPeripheral writeValue:0x17145c410 forCharacteristic:0x174aa46e0 type:0x0] | | writeValue -> _NSInlineData | | forCharacteristic -> CBCharacteristic

05 Unlock Bike Lock

35739 ms 35741 ms 35741 ms 35741 ms

| -[MBKPeripheral writeString:32F5CAA8452A23235201] | | -[CBPeripheral writeValue:0x17125e720 forCharacteristic:0x174aa46e0 type:0x0] | | writeValue -> _NSInlineData | | forCharacteristic -> CBCharacteristic

Unlock Algorithm
32484 ms -[MBKUnlockBikeData setData:001BB441CB88B4034565E1C7BE448CD4B3D9F5CAA8452A23235201]

Message 1 Index ? 30
Message 2 Index ? 31
Message 3 Index ? 32

Message 001BB441CB88B40345
Message 65E1C7BE448CD4B3D9
Message F5CAA8452A23235201

MoBike Demo
50

Repeatable Process
1. Enumerate Services and Characteristics 2. Capture Characteristics Settings
-m "*[CBPeripheral setNotifyValue*]"
3. Capture BLE Reads & BLE Writes -m "*[CBPeripheral readValue*]" -m "*[CBPeripheral writeValue*]"
52

Thank you for
listening!
53

Q&A

