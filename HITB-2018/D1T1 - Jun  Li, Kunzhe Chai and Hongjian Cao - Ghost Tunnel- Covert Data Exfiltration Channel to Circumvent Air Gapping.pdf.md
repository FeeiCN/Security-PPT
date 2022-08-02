Ghost Tunnel
Covert Data Exfiltration Channel to Circumvent Air Gapping
Hongjian CAO, Kunzhe CHAI, Jun LI PegasusTeam, 360 Security Technology April 12, 2018

Who We Are
360 Security Technology is a leading Internet security company in Asia. Our core products are anti-virus security software for PC and cellphones. PegasusTeam was founded in 2015. we focus on the wireless security and wireless penetration testing.
2

Agenda
· Introduction · Previous research on Air-Gapped attack · Ghost Tunnel Introduction · Ghost Tunnel implementation · demo
3

Introduction
· Air-Gapping · Attack events

Air Gapping
· Air gapping - Wikipedia: "air gapping[1] is a network security measure
employed on one or more computers to ensure that a secure computer network is physically isolated from unsecured networks, such as the public Internet or an unsecured local area network.[2] The name arises from the technique of creating a network that is physically separated (with a conceptual air gap) from all other networks."
· Air gapping aims to avoid the intrusion and data leakage through network connections
5

Air-Gapped Network · Considered to be the most secure
6

Nothing Is Impossible · Attack Vectors - Malicious USB - Employee's laptop
7

Stuxnet Worm (2010) · Attacking initiated via
an infected USB drive · Designed to sabotage
centrifuges used at a uranium enrichment plant in Iran
8

NSA Leaks (2013) · COTTONMOUTH-I
- A USB hardware implant - Air-Gap bridging - Extracting data from
targeted systems via RF signals
9

Previous research on Air-Gapped attacks

Previous research - 1
· Using radio frequencies to transmit data from a computer - Computer monitor - Mobile phone FM radio receiver

url: https://thehackernews.com/2014/10/airhopper-hacking-into-isolated.html

11

Previous research - 2
· A covert bi-directional communication channel between two close by air-gapped computers communicating via heat

url: https://thehackernews.com/2015/03/hacking-air-gapped-computer.html

12

Previous research - 3 · Data exfiltration via RF signal by attacking Siemens PLCs

url: https://www.blackhat.com/eu-17/briefings.html#exfiltrating-reconnaissance-data-

from-air-gapped-ics-scada-networks

13

Ghost Tunnel
A Covert Data Exfiltration Channel Using WiFi
14

Air-gapped Attack · Implant
- Malicious software/hardware · A covert communication channel
- Any medium that can carry data is possible
15

Ghost Tunnel

Implant malware
· USB HID attack · BashBunny

Setup C&C tunnel
· Via 802.11 beacon and probe request & response

Exfiltrate data
· Execute Command

16

Ghost Tunnel · Can bypass firewalls · Cross-Platform support · Allow up to 256 clients · Effective range up to 50 meters
17

The Usual Wifi Connection Process
18

Ghost Tunnel ­ No WiFi Connection
19

802.11 State
20

Class 1 Frames
21

Scanning for Wifi Networks
22

Ghost Tunnel ­ No WiFi Connection · A covert WiFi channel using Beacon, Probe Request, Probe
Response
· A special SSID as the identifier
23

Ghost Tunnel
Implementation
24

802.11 Frame
· Control frame · Management frame · Data frame

Octets: 2

2

6

0 or 6 0 or 6

0 or 2

0 or 6 0 or 2

0 or 4 variable

4

Frame Duration Address Address Address Sequence Address

Control

/ID

1

2

3

Control

4

QoS Control

HT Control

Frame Body

FCS

Frame header

25

802.11 Management Frame Body · Management Frame
Body - Fields - Information Elements
26

The components of Information Element
· Element ID: 1 Byte
· Length: 1 Byte
· Information: 0-255 Bytes - SSID - Vendor Specific

Octets:

1 Element ID

1 Length
Element Format

variable Information(payload)

27

SSID Element
· Identity of an ESS or IBSS · SSID length 0-32 Bytes

Octets:

1
Element ID

1
Length

0-32
SSID(Payload)

28

Vendor Specific Element
· ID = 221 · Organization Identifier · Vendor-Specific content

Octets: 1

1

3 or 5

variable

Element ID Length Organization Identifier Vendor-specific content

Payload 29

Key Problem · How to send and receive 802.11 data frames through local wireless network interface in user space ?
· Wireless network interface mode - Master (Acting as an AP) - Managed (Station) - Monitor (Monitor all traffic) -...
30

Through Operating System WiFi API
· Windows - Native Wifi API
· Mac OSX - coreWLAN
· Linux - nl80211 & libnl
31

Windows Client: Send And Receive
DWORD WINAPI WlanScan( _In_ HANDLE hClientHandle, _In_ const GUID *pInterfaceGuid, _In_opt_ const PDOT11_SSID pDot11Ssid, _In_opt_ const PWLAN_RAW_DATA pIeData, _Reserved_ PVOID pReserved );
· scan for available wireless networks - pDot11Ssid, specifies the SSID of the network to be scanned - pIeData != NULLsend probe request - pIeData == NULLnot send probe request
32

Packet payload Format
· DOT11_SSID - Contains the SSID - The maximum length is 32

uSSIDLength

ucSSID (payload)

· WLAN_RAW_DATA
- Contains the elements data - Not exceed 240 bytes

dwDataSize Element ID Length

Information (payload)

DataBlob

33

Windows Client : Receive

DWORD WINAPI WlanGetNetworkBssList(

_In_ HANDLE

hClientHandle,

_In_ const GUID

*pInterfaceGuid,

const PDOT11_SSID

pDot11Ssid,

_In_ DOT11_BSS_TYPE

dot11BssType,

_In_ BOOL

bSecurityEnabled,

_Reserved_ PVOID pReserved,

_Out_ PWLAN_BSS_LIST *ppWlanBssList );

· Retrieve available wireless networks list · ppWlanBssList
- Receive the returned list of of BSS entries

34

Windows Client : Receive

· WLAN_BSS_LIST - An array of WLAN_BSS_ENTRY structures that contains
information about a network

WLAN_BSS_LIST
dwTotalSize dwNumberOfItems
wlanBssEntries

wlanBssEntries[0] wlanBssEntries[1]
... wlanBssEntries[n]

WLAN_BSS_ENTRY
dot11Ssid uPhyId
dot11Bssid ...
ulIeOffset ulIeSize

Payloads
IE [0] IE [1]
...

IE [221] 35

Mac Client : Send · CWInterface - func scanForNetworks(withSSID: Data?)
36

Mac Client : Receive · CWInterface - func scanForNetworks(withSSID: Data?) - func cachedScanResults() -> Set<CWNetwork>? · CWNetwork - informationElementData: Data?
37

C&C Server: Send And Receive · Modified hostapd and hostapd_cli · USB WiFi card
38

Demo
39

Thanks!
Any questions?
40

