YOU'D BETTER SECURE YOUR BLE DEVICES OR WE'LL KICK
YOUR BUTTS !
@virtualabs | DEFCON 26

WHO AM I ?
Head of R&D @ Econocom Digital Security Studying Bluetooth Low Energy for 3 years Developer & maintainer of BtleJuice Having fun with Nordic's nRF51822 

AGENDA
BLE sniffing 101
Improving the BLE arsenal Sniffing BLE connections in 2018 Introducing BtleJack, a flexible sniffing tool
BtleJacking: a brand new attack How it works Vulnerable devices & demos
Recommendations

BLE SNIFFING 101

MUCH CHEAP TOOLS, (NOT) WOW RESULTS
Sniffing existing/new connections with an Ubertooth One
Sniffing new connections with an Adafruit's Bluefruit LE Sniffer
Sniffing BLE packets with gnuradio

UBERTOOTH ONE
Sniffs existing and new connections Does not support channel map updates Costs $120

BLUEFRUIT LE SNIFFER
Up-to-date so ware (Nov. 2017) Proprietary firmware from Nordic Semiconductor Sniffs only new connections Costs $30 - $40

SOFTWARE DEFINED RADIO
Sniffs only BLE advertisements
Unable to follow any existing/new connection
Latency
Requires 2.4GHz compatible SDR device

BLE SNIFFING 101
BLE is designed to make sniffing difficult: 3 separate advertising channels Uses Frequency Hopping Spread Spectrum (FHSS) Master or slave can renegotiate some parameters at any time
Sniffing BLE connections is either hard or expensive

MAN IN THE MIDDLE

HOW BLE MITM WORKS
Discover the target device (advertisement data, services & characteristics)
Connect to this target device, it is not advertising anymore (connected state)
Advertise the same device, await connections and forward data

BTLEJUICE
https://github.com/DigitalSecurity/btlejuice

GATTACKER
https://github.com/securing/gattacker

Pros: Get rid of the 3 advertising channels issue You see every BLE operation performed You may tamper on-the-fly the data sent or received

Cons: Complex to setup: 1 VM & 1 Host computer Only capture HCI events, not BLE Link Layer Does not support all types of pairing Only compatible with 4.0 adapters

WE ARE DOING IT WRONG !
Ubertooth-btle is outdated and does not work with recent BLE stacks Nordic Semiconductor' sniffer is closed source and does not allow active connection sniffing and may be discontinued The MitM approach seems great but too difficult to use and does not intercept link-layer packets

LET'S BUILD OUR OWN !

THE IDEAL TOOL
Able to sniff existing and new connections Uses cheap hardware Open-source

IMPROVING MIKE RYAN' SNIFFING TECHNIQUE
(OR HOW TO SNIFF ACTIVE BLE CONNECTIONS IN 2018)

MIKE'S TECHNIQUE
1. Identify Access Address (32 bits) 2. Recover the CRCInit value used to compute packets
CRC 3. Recover hop interval (time spent on each channel) 4. Recover hop increment (channel hopping increment)

MIKE'S ASSUMPTION (2013)
All 37 data channels are used

DATA CHANNELS IN 2018
Not all channels are used to improve reliability Some channels are remapped to keep a 37 channels hopping sequence
0, 4, 8, 12, 16, 20, 24, 0, 4, 8, 3, 7, 11, 15, 19, 23, 27, 3, 7, 2, 6, 10, 14, 18, 22, 26, 2, 6, 1, 5, 9, 13, 17, 21, 25, 1, 5
Mike's technique does not work anymore !

HOW TO DEDUCE CHANNEL MAP AND HOP INTERVAL
Channel map Listen for packets on every possible channels May take until 4 x 37 seconds to determine !
Hop interval Find a unique channel Measure time between 2 packets and divide by 37

DEDUCE HOP INCREMENT
Pick 2 unique channels Generate a lookup table Measure time between two packets on these channels Determine increment value
More details in PoC||GTFO 0x17

"INSTANT" MATTERS
Defines when a parameter update is effective
Used for: Channel map updates Hop interval updates

WE DON'T CARE AT ALL

WE DON'T CARE AT ALL

WE DON'T CARE AT ALL

WE DON'T CARE AT ALL

WE DON'T CARE AT ALL

MULTIPLE SNIFFERS FOR THE ULTIMATE SNIFFING TOOL

A BRAND NEW TOOL ...

... BASED ON A MICRO:BIT

BTLEJUICE

BTLEJUICEJACK

NO LIVE DEMO :(

SNIFFING A NEW CONNECTION

SNIFFING AN EXISTING CONNECTION

BTLEJACKING
A NEW ATTACK ON BLE

SELECTIVE PRECISE JAMMING

SUPERVISION TIMEOUT
Defined in CONNECT_REQ PDU Defines the time a er which a connection is considered lost if no valid packets Enforced by both Central and Peripheral devices

JAMMING FTW

SUPERVISION TIMEOUT VS. JAMMING

SUPERVISION TIMEOUT VS. JAMMING

SUPERVISION TIMEOUT VS. JAMMING

SUPERVISION TIMEOUT VS. JAMMING

SUPERVISION TIMEOUT VS. JAMMING

SUPERVISION TIMEOUT VS. JAMMING

SUPERVISION TIMEOUT VS. JAMMING

BTLEJACKING
Abuse BLE supervision timeout to take over a connection
Works with BLE v4.x and v5, if using legacy CSA and 1 Mbps
Requires proximity (2 to 10 meters from target)

EXAMPLE OF A VULNERABLE DEVICE

https://fr.lovense.com/sex-toy-blog/lovense-hack

COUNTER-MEASURES
Use BLE Secure Connections (to avoid injection) Authenticate data at application layer (detection) Use BLE version 5 with CSA #2

BTLEJACK
https://github.com/virtualabs/btlejack

FEATURES
Already established BLE connection sniffing New BLE connection sniffing Selective BLE jamming BLE connection take-over (btlejacking) PCAP export to view dumps in Wireshark Multiple sniffers support

CONCLUSION
BLE hijacking is possible and should be considered It might get worse with further versions of BLE Secure your BLE connections !

QUESTIONS ?

CONTACT

@virtualabs damien.cauquil@digital.security

