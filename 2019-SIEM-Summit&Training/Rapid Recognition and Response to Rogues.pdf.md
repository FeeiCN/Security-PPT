Craig Bowser GCDA, GSEC,
GCED 555 Mentor
Rapid Recognition and Response to Rogues

o by NASA on Unsplash

Back door Man in the middle

Etc.

Malware Server

Private business Sniffer

· Network Scans ­ Scan
regularly and perform diffs on each scan
· Tools ­ Install and deploy · Custom tools ­ Build, deploy
and install

Authorized Devices ­ Known, Approved (attributable), up to
Date
Known, but outdated ­ Approved device, but does not
have all required agents/proper configs.
Unauthorized ­ Know what it is and what it does, but it
does not have permission to be on the network.
Unknown ­ Know IP, maybe know OS, ports, but not much
else.

IP & MAC & Hostname .........Maybe OS
.........Maybe open ports ......Signal information... some

1.1.1.1

Provider

OS

Physical location

Open ports (w/ service guess) Link to SIEM to pull up all

MAC Hostname

related events related to that IP

AD Membership

Possible Vendor

Results from Vulnerability Scan

Installed Agents

Network location

IP, MAC and Hostname: DHCP, IPAM, SCCM
AD Membership: WMI or PS query to AD
Possible vendor: Query against MAC OUI file
Vulnerability Scan: Query scanner API or results in SIEM

Installed Agents: Query tool API or compare to lookup table

Network location: Query tool API, SNMP, or CAM tables

Provider:

Often comes with WIDS information

Physical location: CAM tables, tool API, or approx location from WIDS

1 2 3 4
1 2 3 4
https://github.com/ericmccullough/r2d 2

Rogue Inquisitor
https://github.com/reswob10/RogueInquisitor
< logo here TBD>

source2: name: DHCP filename: c:/tools/files/dhcp.csv MAC_Column: 1 IP_Column: 0

ports: - appname: Tanium port: 5123 weight: 2

Host_Column: 2

color: grey weight: 1

Rogue_Score: -5

enabled: 1

Good_Score: 3

Splunk Demo

How do we protect our networks?

Protections
Inventory of Known Devices NAC/Port Security 802.1x Physical Security Zero Trust Model User Education

Challenges
· Large number of possible rogues? · Devices that have limited information? · Can legit users/devices self remediate?

· Tool Improvement
· Add APIs · Add output options
Bryan Goff@bryangoffphoto

