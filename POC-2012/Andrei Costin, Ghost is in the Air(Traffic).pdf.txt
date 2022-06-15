Ghost is in the Air(Traffic)
Andrei Costin <andrei.costin@eurecom.fr> Aurelien Francillon <aurelien.francillon@eurecom.fr>

andrei# whoami SW/HW security researcher, PhD candidate

Mifare Classic MFCUK

Interest in avionics

Hacking MFPs + PostScript

http://andreicostin.com/papers/ http://andreicostin.com/secadv/
1

Administratrivia #0 DISCLAIMER
 This presentation is for informational purposes only. Do not apply the material if not explicitly authorized to do so
 Reader takes full responsibility whatsoever of applying or experimenting with presented material
 Authors are fully waived of any claims of direct or indirect damages that might arise from applying the material
 Information herein represents author own views on the matter and does not represent any official position of affiliated body
 tldr;
 DO NOT TRY THIS AT HOME!  USE AT YOUR OWN RISK!
2

Agenda
1. ATC Today (SSR) 2. Today's Problems 3. ATC "Tomorrow" (ADS-B) 4. "Tomorrow"s Problems 5. Exploit scenarios & Demos 6. Solutions and take-aways
3

ATC Today...
4

How do radars work without ADS-B?
5

SSR transmits basic solicited data
 SSR is solicited type of communication  Solicitation via XPDR  Solicitation via voice VHF
 Example of data from SSR XPDR:  Aircraft Address  Altitude  Code (squawk)  Angles (Roll/Track)
6

Agenda
1. ATC Today (SSR) 2. Today's Problems 3. ATC "Tomorrow" (ADS-B) 4. "Tomorrow"s Problems 5. Exploit scenarios & Demos 6. Solutions and take-aways
7

Automatic Dependent Surveillance - Broadcast (CASA, 2006)

Inputs are not robust enough
8

Garmin GTX32x Avionics Tranponders

Input mistakes have severe implications
9

Agenda
1. ATC Today (SSR) 2. Today's Problems 3. ATC "Tomorrow" (ADS-B) 4. "Tomorrow"s Problems 5. Exploit scenarios & Demos 6. Solutions and take-aways
10

US GOV ITDashboard - FAAXX704 (ADS-B)

ADS-B is a $billions world-wide effort from 2002...
11

Guidance for the Provision of Air Traffic Services Using ADS-B for Airport Surface Surveillance

How does ADS-B work? ­ Architectural view

GPS

GLONASS GALILEO

12

ICAO/FAA ADS-B Implementation Workshop

ADS-B ­ INsideOUT...
 ADS-B is being used over 2 existing technologies:  Mode-S ­ 1090 MHz (replies) and 1030 MHz (interrogation)  PPM @ 1 Mbps  UAT (Universal Access Transceiver) ­ 978 MHz (replies)  CP-2FSK @ 1.041667 Mbps (m13odulation index h >= 0.6)

ATC Tomorrow ­ NextGen, ATC/M and eAircrafts
14

Australia Airservices ADS-B Coverage Map

ADS-B Deployment Map ­ Australia
15

FAA NextGen Technologies Interactive Map (ADS-B)

ADS-B Deployment Map ­ USA
16

How does community get this data?

AirNav RadarBox

Mode-S Beast with miniASDB

Kinetic SBS

Summarized list of enthusiast-level ADS-B radar receivers

PlaneGadgets ADS-B

Aurora Eurotech SSRx

microADSB USB

miniADSB

Funkwerk RTH60
17

microADSB-IP BULLION

How does ADS-B look like? ­ Community view
18

ADS-B frame ­ modulation, format, security
 Frames encoded in  Pulse-position-modulation (PPM)  1 bit = 1 us  Shared-medium (no CA/CD), theoretical bandwidth 1 Mbit/sec
19

ADS-B frame ­ modulation, format, security
 Frames encoded in  Pulse-position-modulation (PPM)  1 bit = 1 us  Shared-medium (no CA/CD), theoretical bandwidth 1 Mbit/sec
 Frames composed of  A preamble  8 bits for TX/RX sync  A data-block  56 bits for short frames  112 bits for extended/long frames  Mandatory to have  24 bits ICAO address of aircraft  24 bits error-detection parity
20

ADS-B frame ­ modulation, format, security
Page intentionally left blank
21

Agenda
1. ATC Today (SSR) 2. Today's Problems 3. ATC "Tomorrow" (ADS-B) 4. "Tomorrow"s Problems 5. Exploit scenarios & Demos 6. Solutions and take-aways
22

ADS-B Main Threats ­ Summary

ADS-B Threat

Fail / warn / ok

Entity/message authentication

Entity authorization (eg. medium access)*

Entity temporary identifiers/privacy

Message integrity (HMAC)

Message freshness (non-replay)

Encryption (message secrecy)

Massive public DBs with private detail*

23

Potential mitigations exist... but are not public
 Mode-4/Mode-5 IFF Crypto Appliqué  2-Levels Crypto secured version of Mode S and ADS-B GPS position  Defined for military NATO STANAG 4193  Enhanced encryption  Spread Spectrum Modulation  Time of Day Authentication  Level1:  Aircraft Unique PIN  Level2:  Level1 + other (unknown for now) information  Apparently based on Black & Red keys crypto
 ADS-B also specifies, but not details available about crypto/security:  DF19 = Military Extended Squitter  DF22 = Military Use Only
24

Agenda
1. ATC Today (SSR) 2. Today's Problems 3. ATC "Tomorrow" (ADS-B) 4. "Tomorrow"s Problems 5. Exploit scenarios & Demos 6. Solutions and take-aways
25

ADS-B ­ Adversary Model ­ By role
 Pilots  Bad intent  (Un)Intentional pranksters
 Pranksters
 Abusive users/organizations  Privacy breachers ­ eg. Paparazzi  Message conveyors
 Criminals  Money (more likely). Eg.: Underground forums with "Worldwide SDRs for hire" ­ potentially very profitable underground biz (think sniff GSM)  Terror (less likely)
 Military/intelligence  Espionage  Sabotage
26

Example: internal prankster attack
 Already happening ­ Callsigns/FlighIDs used in real-life!  Check them on Google or RR forum
27

Example: external abusers + public data correlation

Strategically positioned

Have a well-defined target

Poses inexpensive devices

Can publicly access private details (why is this allowed?!)

28

Public access, seriously? USA (FAA)
29

Public access, seriously? Australia (CASA)
30

Public access, seriously? UK (CAA)
31

ADS-B ­ Adversary Model ­ By location
 Ground-based  Easier to operate (win criminals)  Easier to be caught (win agencies)  Easier to defend or mitigate against (win agencies)  Eg. Angle of arrival, time-difference of arrival
 Airborne  Drones  UAV  Autonomously pre-programmed self-operating checked-in luggage:  Pelican case, barometric altimeter, battery, embed-devs, GPS, RF...  Possibly could work around angle of arrival  Could pose more advanced threat to ADS-B IN enabled aircrafts  Important: not extensively modeled in the attacker & threat modeling of Mode-S/ADS-B
32

Potential for DoS on ATC human-resource
 Attack:  Based on "Fake airplane injection into ATC" attack  Mitigation: there is a mostly manual procedure for an ATC operator to check a flight number against flight plans and flight strips (flight strips is so 1900, really!)
 Twist1:  Inject 1 mln fake airplanes, both valid and invalid flight plans, filed by different flight plan systems  Result: Potential human-resource exhaustion
 Fixes:  Have fully e-automated flight plan exchange and cross-checks  Better, solve ADS-B insecurities and potential is nullified
33

Potential for DoS on ATC flight-space resource
 Attack:  Similar to "DoS on ATC human-resource"
 Twist1:  Fake planes scattered on wide geographic area of responsibility of "victim ATC"  The area of ghost/fake/unidentified aircraft/object is in "flight quarantine"  Separation are increased, all normal routes deviated  General rules are in ICAO 4444 + country specifics  This is done for safety reasons (eg. ASSET methodology) to avoid disasters  A potentially wide geo-area affected in terms of air-traffic ­ nightmare!
 Twist2:  Fake a copy of a genuine aircraft within it's own area of separation  Will generate a Short Term Conflict Alert (STCA)
 Fixes:  Locate and turn-off attacker RF emitter (but what if it's a drone?)  Better, solve ADS-B insecurities and potential is nullified
34

Potential for DoS on ADS-B IN aircrafts
 Attack:  Based on "Fake airplane injection into ATC" attack  Mitigation: unknown, perhaps similar to ATC semi-auto/semi-manual flight plan cross-check
 Twist1: Inject fake airplanes (1...1 mln) into ADS-B IN capable aircrafts  Assumption: Target aircraft lacks good connectivity and automated crosscheck protocols for flight plan lookup and validation (compared to ATC)  Result: Total uncertainty in received data, i.e. data is useless...
 Fixes:  Have real-time critical data exchange and verification capability on eAircrafts  Have fully e-automated flight plan exchange and cross-checks  Better, solve ADS-B insecurities and potential is nullified
35

Hardware setup

Hardware

Functions

SDR USRP1

Main RF support

Price 700 USD

SBX

ADS-B OUT/IN (attack)

475 USD

WBX

ADS-B OUT/IN (attack)

450 USD

DBSRX2

ADS-B IN (verify)

150 USD

Plane Gadget Attenuators Cables

ADS-B IN (verify) Limit output (SMA cable)

~245 USD <10 USD

Alternative SDRs

Alternative ADS-Bs

36

ADS-B Message Replay Quick reference
 Capture ADS-B data:  UHD-mode  uhd_rx_cfile.py --spec B:0 --gain 25 --samp-rate 4000000 -f 1090000000 -v ~/CAPTURE_adsb.fc32  Pre-UHD-mode  usrp_rx_cfile.py
 Replay the captured data:  UHD-mode  tx_transmit_samples --file ~/CAPTURE_adsb.fc32 --ant "TX/RX" --rate 4000000 --freq 1090000000 --type float -subdev B:0  Pre-UHD-mode  usrp_replay_file.py
37

ADS-B Message Injection Quick reference guide
 ADS-B data crafting  Tweak the captured data  Load I/Q data: d_cap = read_float_binary(`~/CAPTURED_adsb.fc32')  Modify the samples: d_cft = adsb_randomize(d_cap)  Write back I/Q data: write_float_binary(d_cft, `~/CRAFTED_adsb.fc32')  Generate the data  MatLab ­ modulate(adsb_frame, fc, fs, `ppm')  GNUradio ­ write native C++ block
 Transmit the crafted data:  UHD-mode  tx_transmit_samples --file ~/CRAFTED_adsb.fc32 --ant "TX/RX" --rate 4000000 --freq 1090000000 --type float --subdev B:0  Pre-UHD-mode  usrp_replay_file.py
38

ADS-B Message Analyze/Visualize/Plot Quick reference guide
 GNURadio ModeS tests:  Pre-UHD-mode (by Eric Cottrell):  gr-air/src/python/usrp_mode_s_logfile.py  UHD-mode (by Nick Foster):  gr-air-modes/python/uhd_modes.py ­a ­w ­F ~/CRAFTED_adsb.fc32
 GNURadio:  gr_plot_psd_c.py -R 4000000 ~/CAPTURE_adsb.fc32  gr_plot_psd_c.py -R 4000000 ~/CRAFTED_adsb.fc32
 Octave + gnuplot:  n_samp = 500000  trig_lvl = 0.01  d_cap = read_float_binary(`CAPTURE_adsb.fc32', n_samp)  axis ([0, n_samp, -trig_lvl, trig_lvl])  plot(arr)
39

Code showcase
40

Demo showtime
 http://www.youtube.com/zveriu
41

Agenda
1. ATC Today (SSR) 2. Today's Problems 3. ATC "Tomorrow" (ADS-B) 4. "Tomorrow"s Problems 5. Exploit scenarios & Demos 6. Solutions and take-aways
42

High-level perspective ­ Timelines
 SDR Community  1988 (Peter Hoeher and Helmuth Lang) - SDR prototype  1991/1992 (Joseph Mitola) - SDR theory and paper  October 2003 (Ettus) - USRP1 available $US750  September 2008 (Ettus) - USRP2 available $US1700 (http://www.ruby-forum.com/topic/165227)  13 Jan 2010 (Ettus) - WBX Tranceiver board available (http://lists.gnu.org/archive/html/discuss-gnuradio/2010-01/msg00146.html)  23 Mar 2011 (Ettus) - USRP N200 $US1500 and USRP N210 $US1700 available (http://lists.ettus.com/pipermail/usrpannounce_lists.ettus.com/2011-March/000007.html)  15 Apr 2011 (Ettus) - SBX Tranceiver board available (http://lists.ettus.com/pipermail/usrp-announce_lists.ettus.com/2011-April/000008.html)  February 2012 (Antti Palosaari) - RTL-SDR discovered (http://thread.gmane.org/gmane.linux.drivers.video-inputinfrastructure/44461/focus=44461)
 ADS-B Standartization/Regulatory  Jul 2002 (FAA) - Federal Aviation Administration (FAA) announced a dual link decision using 1090 MHz ES for air carrier and private/commercial operators of high performance aircraft and UAT for the typical general aviation user as media for the ADS-B system in the United States (http://www.faa.gov/news/press_releases/news_story.cfm?newsId=5520&print=go)  March 2003 - First ADS-B demonstrations (AOPA for CAP)  April 2003 (RTC) - DO-260A "Minimum Operational Performance Standards for 1090 MHz Extended Squitter Automatic Dependent Surveillance ­ Broadcast (ADS-B) and Traffic Information Services ­ Broadcast (TIS-B)"  Jul 2004 (RTC) - DO-282A "Minimum Operational Performance Standards for Universal Access Transceiver (UAT) Automatic Dependent Surveillance ­ Broadcast."  2004 - US Development & testing stations deployed  2007 - Early estimates stated the cost to equip a general aviation aircraft ranged from $7,644 to $10,920 for ADS-B Out and from $10,444 to $29,770 for ADS-B Out and ADS-B In, depending on aircraft type.  2009 - US Ground segment implementation and deployment  2009 - Assuming 2009 market prices for individual system components, a UAT retrofit was estimated at $18,000 and new at $25,000. For a 1090ES retrofit $4,200 and new at $18,000.  Dec 2009 - Australia in world first for nationwide ADS-B coverage
 Research community  Jan 2001 - An Assessment of the Communications, Navigation, Surveillance (CNS) Capabilities Needed to Support the Future Air Traffic Management System  Oct 2001 - Vulnerability accessment of the transportation infrastructure relying on GPS  2002 - Validation techniques for ADS-B surveillance data  2003 - GPS integrity and potential impact on aviation safety  Sept 2004 - Aircraft ADS-B Data Integrity Check  2008/2009 - Vast security research on Future eEnabled Aircraft and their support infrastructure  Oct 2010 - Identification of ADS-B System Vulnerabilities and Threats  2010 - Assessment and Mitigation of Cyber Exploits in Future Aircraft Surveillance  2010 - Visualization \& Assessment Of ADS-B Security For Green ATM  2011 - Security analysis of the ADS-B implementation in the next generation air transportation system  Oct 2011 - Aircraft Systems Cyber Security  Oct 2011 - On the Requirements for Successful GPS Spoofing Attacks  Jul 2012 - Practical setups and demonstrations on ADS-B attacks (BH12US, DC19)
43

ADS-B Security Solutions
 Solutions could include:  Verifiable multilateration (MLAT) with multiple ground-stations, but:
 "Group of aircrafts" concepts  AANETs should inspire from VANETs solutions  Lightweight PKI architectures and protocols. Our thoughts:
 FAA, EUROCONTROL, CASA as CAs  CAs root keys installed/updated during ADS-B device mandatory certification process  HMAC on each broadcast message  Every broadcast a subset of HMAC bits
44

Take-aways
 ADS-B is a safety-related mission-critical technology
 Yet, ADS-B lacks minimal security mechanisms  This poses direct threat to safety
 ADS-B costs tremendous amount of money, coordination, time  Yet, ADS-B is defeated in practice with  FOSS or moderate-effort custom software  Relatively low-cost SDRs hardware
 ADS-B assumptions are not technologically up-to-date  Doesn't account users will have easy access to RF via SDRs  Doesn't account users will have easy access to UAV, drones, etc.
 SDRs and their decreasing price are not the problem
ADS-B is flawed and is the actual root-cause problem
45

References (academia, standards, reports)
46

References (related talks)
 22C3 ­ I see airplanes  DefCon17 ­ Air Traffic Control: Insecurity and ADS-B  DefCon18 ­ Air Traffic Control Insecurity 2.0  GRConf2011 ­ ADS-B in GnuRadio  DefCon20 ­ Hacker + Airplanes = No Good Can Come Of This
47

Thank you! Questions, ideas, corrections?
Andrei Costin <andrei.costin@eurecom.fr> Aurelien Francillon <aurelien.francillon@eurecom.fr>

