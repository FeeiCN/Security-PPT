Stealthily Access Your Android Phones: Bypass the Bluetooth Authentication
BlueRepli
by Sourcell Xu and Xin Xin
#BHUSA @BLACKHATEVENTS

Who we are

Sourcell Xu
· IoT security researcher · fO-000/bluescan · Discovered of the BlueRepli · sourcell.xu@dbappsecurity.com.cn
Xin Xin

DBAPP Security

· Hardware hacker · Make the BlueRepli a convenient hardware tool

HatLab @DS_HatLab

· xin.xin@dbappsecurity.com.cn

(Hack Any Thing)

#BHUSA @BLACKHATEVENTS

Chaotic Scenes of Privacy
· Access phone files 25,000 times in 10 minutes.
· Self-starting 7000 times and read the phone book in one hour.
#BHUSA @BLACKHATEVENTS

Could it be Worse?

No malicious or rogue apps
installed

No touch

PBAP (Phone Book Access Profile)

Android system

Bluetooth

Wi-Fi

Mobile Network

NFC

MAP (Message Access Profile)
#BHUSA @BLACKHATEVENTS

What's Bluetooth Profile?

PSE (Phonebook Server Equipment)
PBAP
PCE (Phonebook Client Equipment)

MCE (Message Client Equipment)
MAP
MSE (Message Server Equipment)
#BHUSA @BLACKHATEVENTS

Previous Research: BadBluetooth
· Require a malicious app with Bluetooth Permission has been installed on the victim's Android phone.
· PBPA and MAP require the Bluetooth device to be initiator and the phone to be the acceptor, which is opposite to the attack flow. This make the attack less stealthy.
#BHUSA @BLACKHATEVENTS

What can BlueRepli do?

for almost all Android phones
· Only one interaction with the victim
· The attacker can make this interaction very deceptive.

for a well-known manufacture (may be affected 100 million devices)
· Totally Stealthily
attack

attack deceived
contacts, call logs, short messages

contacts, call logs, short messages

or

attack

fake short message

victim 1

victim 2
#BHUSA @BLACKHATEVENTS

Two Dialog Boxes During Access to PBAP and MAP

1

2

Pairing Request

Profile Access Request

How to bypass?

How to bypass?
#BHUSA @BLACKHATEVENTS

Why does the Pairing Request pop up?
Connect No valid link key

New link key

Secure Simple Pairing Shared

New link key

· Future authentication · Traffic encryption

#BHUSA @BLACKHATEVENTS

The default IO capabilities of AOSP is DisplayYesNo
#BHUSA @BLACKHATEVENTS

Bypass the Pairing Request Dialog Box
#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

Side Effect of the Just Works Model

NoInputNoOutput

Just Works

Temporary Bond

#BHUSA @BLACKHATEVENTS

Why does the Profile Access Request pop up?
No address
#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

Bypass the Profile Access Request Dialog Box

PBAP
Address dependent?
MAP

#BHUSA @BLACKHATEVENTS

Side Effect of the Just Works Model
com.android.bluetooth

NoInputNoOutput
PBAP and MAP access permission cleared

Just Works
Temporary Bond
#BHUSA @BLACKHATEVENTS

Forge CoD to prevent passing BT_BOND_STATE_NONE
#BHUSA @BLACKHATEVENTS

Persistent Bond Cause Just Works not to be automatically accepted
#BHUSA @BLACKHATEVENTS

The two methods are mutually exclusive

The method for bypassing Pairing
Request Temporary Bond

( ,  )
The method for bypassing Profile Access Request
Forge Address and CoD

#BHUSA @BLACKHATEVENTS

Turnaround 

No BT_BOND_STATE_NONE No BOND_NONE
No Permission clear

#BHUSA @BLACKHATEVENTS

This is the whole picture of BlueRepli

for almost all Android phones
· One interaction with the victim · The attacker can make this
interaction very deceptive.
attack deceived
contacts, call logs, short messages

for a well-known manufacture (may be affected 100 million devices)
· Totally Stealthily
attack

contacts, call logs, short messages

or

attack

fake short message

victim 1

victim 2
#BHUSA @BLACKHATEVENTS

Command Line Tool Hardware Tool

#BHUSA @BLACKHATEVENTS

Should we based on RaspberryPi ?

Linux

No battery support. Low integration, jumper wire everywhere. HDMI is not a good idea for portable device. SPI is too slow for higher resolution LCD panel. We just want a challenge.

Python

Bluetooth

#BHUSA @BLACKHATEVENTS

Choose the solution.
Single Cortex-A7@ 1.2GHz Integrated 128MB DDR3 SDIO & UART for baseband RGB Parallel Interface for LCD AXP203 PMU for Li-ion battery

2.4GHz Wi-Fi on SDIO interface Supported by Nexmon BR/LE 5.0 on UART interface Supported by InternalBlue
Actually this is an image of BCM4343S
#BHUSA @BLACKHATEVENTS

Porting the bootloader an OS

Buildroot & U-Boot & Linux

#BHUSA @BLACKHATEVENTS

Coding the GUI Interface.
#BHUSA @BLACKHATEVENTS

Making a 3D printed shell.
#BHUSA @BLACKHATEVENTS

The video demo
#BHUSA @BLACKHATEVENTS

More security issues in the Bluetooth Profiles

A2DP ATT AVRCP BIP BPP

CIP CTP DIP DUN FAX

FTP

HCRP

GAVDP HDP

GAP

HFP

GATT

HID

GOEP

HSP

ICP LAP MESH MAP OBEX

OPP

SDAP WAPB

PAN

SAP

UDI

PBAP SYNCH ESDP

PXP SyncML VCP

SPP

VDP

TAP

#BHUSA @BLACKHATEVENTS

Thank you!

Any questions?

sourcell.xu@dbappsecurity.com.cn

xin.xin@dbappsecurity.com.cn
#BHUSA @BLACKHATEVENTS

