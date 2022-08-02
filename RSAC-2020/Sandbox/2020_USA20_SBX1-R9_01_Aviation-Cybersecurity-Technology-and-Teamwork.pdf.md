SESSION ID: SBX1-R9
Aviation Cybersecurity: Technology and Teamwork

Pete Cooper MD Aerospace Sandbox

Patrick Kiley Principal Security Consultant Rapid7

Ken Munro Partner Pen Test Partners

#RSAC

Talk objectives
Aviation security primer. Share experiences. Contribute to future aviation safety. Caveat: you're more likely to be pwned through your business network and supply chain than through your planes & airports
2

Responsible disclosure
Aircraft are hard to fix if an issue is found. We, and our friends and families, fly. Disclose to vendors and regulators.
3

Hacking Satcom Terminals
Do you have any control over the smart devices your crews bring on board? How secure are the wireless networks on board your vessels? Have you checked the separation of your on-board networks?
4

How did we get started?
5

Aircraft access

Avionics Bays
6

Ground power
6

Aircraft connectivity
VHF / HF
7

Aircraft domains
Aircraft Control Domain (ACD)

Airline Information Services Domain
(AISD)

8

Passenger Information & Entertainment Services
Domain (PIESD)

Aircraft connectivity

SATCOM

GNSS (GPS / Galileo)

WAAS / EGNOS

NAV (ILS / VOR / DME / NDB)

Secondary radar (transponder)

WQAR (3/4G, WiFi)
9

2GHz MSS CGC

ADS-B TCAS

Aircraft connectivity
Crew / PAX WiFi
FAP USB
FMS > Map
10

ACD Connectivity
11

ACD Connectivity
EFBs (Often iPads) AIDS PDL PMAT
12

Aircraft control databuses ­ ARINC 429

Legacy, point-to-point, one source, multiple recipients
+/- 10v differential pairs
12/100kbps
32bit words Source/sink/data
Odds parity check

+10v

"0" Source
(Tx)

0v

"1"Sink

-10v

(Rx)

Sink (Rx)

13

Aircraft buses ­ AFDX (ARINC 664)
Ethernet 787 / A350 / A380+ MACs / Virtual Links UDP/ICMP/SNMP(!) Data concentrators
14

Updates
Dataloaders typically run ARINC 615, layered over 429 Primarily nav databases, but also avionics software Manual installation overhead, code rarely signed Desire to update OTA
15

Hardware RE Strategy
Search for datasheets (often very old) Trace / buzz out pins (gah, conformal coating) Saleae Dataman / firmware binary dump RO protection uncommon
16

The future (is now...)
Common core system VxWorks LSAP
17

Common core system VxWorks LSAP
18

