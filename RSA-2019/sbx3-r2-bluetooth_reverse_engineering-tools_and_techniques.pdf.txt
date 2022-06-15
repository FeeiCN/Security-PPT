SESSION ID: SBX3-R2
Bluetooth Reverse Engineering: Tools and Techniques

Mike Ryan
Founder ICE9 Consulting @mpeg4codec

#RSAC

#RSAC

#RSAC
$20,000

#RSAC
Ubertooth One
$120

#RSAC
There is a Better Way!

#RSAC
+

#RSAC
Outline
1. Overview of Bluetooth 2. Approach 1: Android
­Case studies 1-3
3. Approach 2: Ubertooth
­Case study 4
4. Questions

#RSAC
Profiles

#RSAC

Classic Bluetooth: Serial Port Profile (SPP)

Bluetooth Smart (BLE): Write + Notify

#RSAC
Approach 1: Android

#RSAC
Case Study 1: BLE Blood Pressure Monitor

#RSAC
Wireshark

#RSAC

#RSAC
Case Study 2: Mystery Classic BT Device

?

1.Transmit & play back audio 2.Misc configuration
A2DP? HFP?

Wireshark ag

#RSAC

#RSAC
"Educated guess"

#RSAC
Aside: Talking to this device
Step 1: Pair using system dialog Step 2:
from PyBT import BDAddr, BluetoothSocket
bdaddr = BDAddr('11:22:33:44:55:66') f = BluetoothSocket(socket.AF_BLUETOOTH, socket.SOCK_STREAM,
socket.BTPROTO_RFCOMM) f.connect_rc(bdaddr, 1)
f.send(...) f.recv(...)

#RSAC
Case Study 3: Bluetooth Credit Card

#RSAC
What is a Bluetooth credit card?
+ ==

#RSAC

#RSAC

#RSAC
tx 02be01013030310000000000000000000000008f ....001............. tx 02bf0101000000000000000000000000000000bf .................... tx 02ea0101000000000000000000000000000000ea .................... tx 02c50101303000000000000000000000000000c5 ....00.............. tx 02ea0101000000000000000000000000000000ea .................... tx 02b9010131304669727374206e616d65000000ee ....10First name.... tx 02b302013130313034666f6f6f31303b3939388f ....10104fooo10;998. tx 02b3020238373737373f30303330300000000087 ....87777?00300..... tx 02ea0101000000000000000000000000000000ea .................... tx 02c50101313000000000000000000000000000c4 ....10..............
02 XX YY ZZ .. .. .. .. .. .. .. .. .. .. .. .. .. .. .. WW XX ­ opcode YY ­ total number of messages ZZ ­ current message WW ­ checksum

#RSAC
BlueZ Toolbox
bluetoothctl gatttool
Optional:
btmon btmgmt
Disclaimer: There might be better tools for this

#RSAC
Active Reversing Procedure
1.Pair using bluetoothctl 2.Send commands with gatttool 3.Analyze command output 4.Fuzz anyway!

#RSAC
Approach 2: Ubertooth

#RSAC
Q: When should I use Ubertooth? A: When you have no alternative

#RSAC
Case Study 4: Original Boosted Board
Dark days of 2014/2015: No app!
Richo Healey ­ co-conspirator

#RSAC

#RSAC
Boosted board protocol

FFFF0 3FF1

RC00000 RC02002 RC02327 RC027D6 RC02AA6 RC032F4

idle dead man's trigger
increasing throttle

Tools:
BlueZ PyBT

#RSAC
Techniques:
· Do things in app / on device · Export from Wireshark to
JSON · Smash face against keyboard
repeatedly

#RSAC
"Apply" Slide
Bluetooth devices continue to proliferate with limited security oversight This talk describes affordable tools and techniques you can use to analyze Bluetooth devices you currently use If you are developing a Bluetooth device, real attackers will use these techniques against your devices so take steps to harden your security posture
31

