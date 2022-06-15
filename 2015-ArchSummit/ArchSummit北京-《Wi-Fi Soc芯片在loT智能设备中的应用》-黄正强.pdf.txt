ArchSummit 2015
Wi-Fi SoC IoT
Frank Huang Marvell Semiconductor Inc.

Marvell Confidential © 2015. All rights reserved.

Marvell Confidential © 2015. All rights reserved.


· IOT ­ Wi-Fi ­ Bluetooth Smart ­ Z-Wave ­ ZigBee ­ Thread
· IOT Wi-Fi SoC  ­  (Highly Integrated SoC) ­  (Smart Configuration) ­  (Power Saving Optimization) ­  (Bridge for Mesh) ­  (Auto Link in Mesh)
4 Marvell Confidential © 2015. All rights reserved.


· IOT ­ Wi-Fi ­ Bluetooth Smart ­ Z-Wave ­ ZigBee ­ Thread
· IOT Wi-Fi SoC  ­  (Highly Integrated SoC) ­  (Smart Configuration) ­  (Power Saving Optimization) ­  (Bridge for Mesh) ­  (Auto Link in Mesh)
5 Marvell Confidential © 2015. All rights reserved.

IOT
IOT Smart Devices 6
Marvell Confidential © 2015. All rights reserved.

Wi-Fi
· A.K.A Wireless LAN · Based on IEEE 802.11 MAC/PHY Specification · 802.11b(1999)/g(2003)/n(2009)
­ Running at 2.4 GHz ­ Rate up to 150 Mbps for 1X1 at 40 MHz bandwidth in 11n · 802.11a(1999)/n(2009)/ac(2013) ­ Running at 5GHz ­ Rate up to 867 Mbps for 1X1 at 160 MHz bandwidth in 11ac · 802.11ad (WiGig®, 2012. Merged with Wi-Fi in 2013) ­ Running at 60 GHz ­ 6.75 Gbps · 802.11af (White-Fi/Super Wi-Fi, 2014) ­ Running on white space spectrum in the VHF/UHF bands between 54 and 790 MHz ­ Rate is 26.7 Mbps for 6/7 MHz channels and 35.6 Mbps for 8MHz channel · 802.11ah (Est 2016) ­ Low power and range up to 1km ­ Running at 900 MHz ­ Rate at least 100 Kbps · 802.11ax (early stage) ­ Based on 802.11ac ­ Running at 5GHz ­ Significantly improved throughput in dense deployments
Marvell Confidential © 2015. All rights reserved.

Bluetooth Smart
· A.K.A Bluetooth Low Energy (BLE) · Based on Bluetooth 4.0 standard released in 2010 · Enhanced in version 4.1 and 4.2 · For low power devices like healthcare, fitness, wearable etc. · Not backward compatible with classic Bluetooth protocol · Running at 2.4 GHz · Rate 1Mbps
Marvell Confidential © 2015. All rights reserved.

Z-Wave
· Proprietary design (from Sigma Designs Inc.) · Low power · For battery-operated devices like smoke alarms, security
sensors etc. · Running at 900 MHz · Rate up to 100 kbps
Marvell Confidential © 2015. All rights reserved.

ZigBee
· Based on IEEE 802.15.4 ratified in 2004 · Conceived in 1998, standardized in 2003 and revised in 2006 · Mesh network topology (OK with Star and Tree) · ZigBee PRO (A.K.A ZigBee 2007)
­ Backward compatible with ZigBee 2006 devices ­ Enhanced routing process · ZigBee IP (ZIP, 2014) ­ IPv6 ­ Over 6LoWPAN · Up to 65K devices per network · Low Cost, Low Power · Running at 2.4GHz globally · Rate up to 250 kbps
Marvell Confidential © 2015. All rights reserved.

Thread
· Alliance initiated by Google® in July 2014 · Running on existing 802.15.4 silicon · Stack based on 802.15.4-2006 version · UDP with IPv6 · Over 6LoWPAN · Up to 250 devices per network · Designed for very low power operation · Running at 2.4GHz · Rate up to 250 kbps
Marvell Confidential © 2015. All rights reserved.



Indoor Range
Max # of device
Data Rate

Wi-Fi >50m
Implementation dependent
>1Gbps

BLE

Z-Wave

50m

30m

Implementation 232
dependent

1Mbps

100 Kbps

ZigBee 10-20m 65K
250 Kbps

Thread 10-20m 250
250 Kbps

Frequency 2.4 GHz /5GHz 2.4GHz

Mesh Support Yes* IP Support V4/V6

No* V4/V6

908/916 2.4GHz MHz (U.S)
Limited Yes

No

V6*

2.4 GHz
Yes V6

Low Power No*

Yes

Yes

Yes

Yes

1 2
Marvell Confidential © 2015. All rights reserved.



Well Deployed? High Throughput? Long Range? Internet Connection? Power Friendly? Good Roadmap?

Wi-Fi
    * 

BLE

Z-Wave ZigBee Thread



*













*











*



















Wi-Fi is still a GREAT solution for IOT
1 3
Marvell Confidential © 2015. All rights reserved.


· IOT ­ Wi-Fi ­ Bluetooth Smart ­ Z-Wave ­ ZigBee ­ Thread
· IOT Wi-Fi SoC  ­  (Highly Integrated SoC) ­  (Smart Configuration) ­  (Power Saving Optimization) ­  (Bridge for Mesh) ­  (Auto Link in Mesh)
1 4
Marvell Confidential © 2015. All rights reserved.


· Low Cost ­ Highly integrated SoC
· Easy Configuration ­ Smart configuration
· Low Power ­ Good power saving scheme
· Mesh Network ­ Simple solution with Wi-Fi bridge ­ Mesh becomes more important in order to increase the range
Marvell Confidential © 2015. All rights reserved.


· IOT ­ Wi-Fi ­ Bluetooth Smart ­ Z-Wave ­ ZigBee ­ Thread
· IOT Wi-Fi SoC  ­  (Highly Integrated SoC) ­  (Smart Configuration) ­  (Power Saving Optimization) ­  (Bridge for Mesh) ­  (Auto Link in Mesh)
1 6
Marvell Confidential © 2015. All rights reserved.

 (Highly Integrated SoC)
· Integrate components to a single SoC ­ Controller ­ Wi-Fi ­ Low RBOM - integrate as many as possible including PA, LNA, T/R switch etc.
· Process upgrade ­ 55 nm  40 nm  28 nm  ...
· Other methods that can reduce the die size ­ Reduce memory etc.
Marvell Confidential © 2015. All rights reserved.


· IOT ­ Wi-Fi ­ Bluetooth Smart ­ Z-Wave ­ ZigBee ­ Thread
· IOT Wi-Fi SoC  ­  (Highly Integrated SoC) ­  (Smart Configuration) ­  (Power Saving Optimization) ­  (Bridge for Mesh) ­  (Auto Link in Mesh)
1 8
Marvell Confidential © 2015. All rights reserved.

 (Smart Configuration)
· No screen/No keypad for most of IOT devices · Configure through Phone/Pad devices · Solutions
­ Probe Request Based ­ Multicast Data Based ­ Micro AP Based
Marvell Confidential © 2015. All rights reserved.

Probe Request Based

Connection

Probe Request

IOT Connection

IOT

Ext-AP
Get SSID & Password from Probe request

2 0
Marvell Confidential © 2015. All rights reserved.

Multicast Data Based

Connection

Multicast Data

IOT Connection
IOT

Ext-AP
Get SSID & Password from multicast data

2 1
Marvell Confidential © 2015. All rights reserved.

Micro AP Based

Connection & Provisioning

IOT Connection
IOT

Ext-AP
Running in Micro AP mode
Get SSID and Password from provisioning data

2 2
Marvell Confidential © 2015. All rights reserved.



Fast configuration? Easy to use? Works with all Ext-AP? Android Phone/Pad? iPhone/iPad (w/o WAC)?

Probe
    

Multicast
    

Micro AP
    

 Which one to use?  Combined solution  Probe Request  Multicast Data  Micro AP

2 3
Marvell Confidential © 2015. All rights reserved.


· IOT ­ Wi-Fi ­ Bluetooth Smart ­ Z-Wave ­ ZigBee ­ Thread
· IOT Wi-Fi SoC  ­  (Highly Integrated SoC) ­  (Smart Configuration) ­  (Power Saving Optimization) ­  (Bridge for Mesh) ­  (Auto Link in Mesh)
2 4
Marvell Confidential © 2015. All rights reserved.

 (Power Saving Optimization)
· Reduce transmission power ­ Range is shortened ­ Compensated by mesh topology
· Host controller sleep ­ Offload connection maintenance to Wi-Fi module ­ Keep controller sleep during idle ­ Turn off Wi-Fi module during idle and fast recovery when needed
· Adjustable wakeup period in Wi-Fi ­ Use multiple DTIM scheme ­ Wake up every N beacon intervals
2 5
Marvell Confidential © 2015. All rights reserved.


· IOT ­ Wi-Fi ­ Bluetooth Smart ­ Z-Wave ­ ZigBee ­ Thread
· IOT Wi-Fi SoC  ­  (Highly Integrated SoC) ­  (Smart Configuration) ­  (Power Saving Optimization) ­  (Bridge for Mesh) ­  (Auto Link in Mesh)
2 6
Marvell Confidential © 2015. All rights reserved.

 (Bridge for Mesh)
· Wi-Fi Mesh Network · What kind of Mesh · Bridge for Wi-Fi · Learning Table in Bridge · Stackable Bridge · Bridge based Wi-Fi Mesh Network
Marvell Confidential © 2015. All rights reserved.

Wi-Fi Mesh Network
· What is Wi-Fi Mesh? ­ Each node can relay/forward data for the network ­ Router/Portal connected to LAN or Internet ­ Self forming for the best path ­ Self healing to recover the link
· Why Mesh for Wi-Fi network? ­ Compensate the range reduced by lowering transmission power ­ Increase the reliability of network connectivity
· 802.11S (Mesh Specification) ­ Initiated in 2004, ratified in 2011 ­ Based on HWMP (Hybrid Wireless Mesh Protocol) for MAC address based routing ­ Used in OLPC (One Laptop Per Child)
Marvell Confidential © 2015. All rights reserved.

What Kind of Mesh?
· Not 802.11S ­ Complicated in implementation ­ Need more resource in memory, CPU power etc. in order to work efficiently ­ Inter-operability issue due to lack of full support from vendors
· Bridge Based Mesh ­ Mature technology ­ Cost-effective ­ Simplified implementation to cover forming and healing
Marvell Confidential © 2015. All rights reserved.

Bridge for Wi-Fi
· Each Bridge has 3 components ­ Bridge ­ In-AP ­ In-STA
· IP/MAC address based ­ Source learning ­ MAC address conversion ­ Broadcast/multicast handling
· Support both IPv4 and IPv6 ­ ARP (Address Resolution Protocol) checking for IPv4 ­ NDP (Neighbor Discovery Protocol) checking for IPv6 ­ DHCP checking
· Packet is forwarded/bridged between IOT device and router

Learning Table in Bridge
· Learning table is built up based on both IP address and MAC address
· Corresponding port number decides where to forward the packet
Marvell Confidential © 2015. All rights reserved.

(Stackable Bridge)
· Bridges can be linked to another bridge in order to extend longer range.
Marvell Confidential © 2015. All rights reserved.

Bridge based Wi-Fi Mesh Network
· Multiple bridges linked to each other to forward traffic between IOT devices and router (Ext-AP)
Marvell Confidential © 2015. All rights reserved.


· IOT ­ Wi-Fi ­ Bluetooth Smart ­ Z-Wave ­ ZigBee ­ Thread
· IOT Wi-Fi SoC  ­  (Highly Integrated SoC) ­  (Smart Configuration) ­  (Power Saving Optimization) ­  (Bridge for Mesh) ­  (Auto Link in Mesh)
3 4
Marvell Confidential © 2015. All rights reserved.

 (Auto Link)
· Link and Path build Up · Node Addition · Node Removal · Link and Path Optimization
Marvell Confidential © 2015. All rights reserved.

(Link and Path build up)
· Forming ­ Simplify the implementation · No 802.11aq (shortest path bridge) · No 802.1d (spanning tree) ­ Based on Received Signal Strength Indicator (RSSI)
· Healing ­ Dead loop detection ­ RSSI monitoring · No change required for good link · Periodically scanning to look for better link ­ Node addition/Node removal ­ Auto recovery after link lost
Marvell Confidential © 2015. All rights reserved.

(Node Addition)
· Link re-established when a new node is added
ADD Marvell Confidential © 2015. All rights reserved.

(Node Removal)
· Link re-established when a node is removed
RMV
Marvell Confidential © 2015. All rights reserved.

(Link/Path Optimization)
· Redundant links are removed during optimization · Dead loop (DL) is blocked
DL
Marvell Confidential © 2015. All rights reserved.

Review
Marvell Confidential © 2015. All rights reserved.


· Wi-Fi is still a GREAT solution for IOT connectivity ­ Valuable to invest more
· Smart Configuration ­ Provide easy Wi-Fi setup
· Power Optimization ­ Lower transmission power ­ Sleep as long as possible
· Bridge Based Wi-Fi Mesh network ­ Compensate range reduced by lowering transmission power ­ Reduce development cycle and cost with mature technology ­ Optimize link/path to have efficient performance
Marvell Confidential © 2015. All rights reserved.

Marvell Confidential © 2015. All rights reserved.

