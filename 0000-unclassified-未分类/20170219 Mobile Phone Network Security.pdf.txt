Mobile Phone Network Security
Internet Security [1] VU
Adrian Dabrowski, Markus Kammerstetter, Georg Merzdovnik, Stefan Riegler and Aljosha Judmayer
inetsec@seclab.tuwien.ac.at

Mobile phone networks

­ 1G
· Not standardized
­ 2G (GSM)
· From 1980es · Introduced SIM · Started as CS, now
PS
­ 3G (UMTS)
· From 1990es
­ 4G (LTE)
· From 2000nd

Planes
­ User Plane
· Voice, Data, SMS
­ Signaling Plane
· Call setup, ...
­ Management Plane
· Network organization

Structure of a 2G/3G System
Source: LTE Security ­ Dan Forsberg

Legend
User Equipment (UE)  Radio Access Network (RAN)  Core Network (CN)
Universal Terrestrial Radio Access Network (UTRAN) GSM/EDGE Radio Access Network (GERAN)
GPRS Support Node (SGSN) Gateway GPRS Support Node (GGSN) Mobile Switching Centre (MSC)

Radio Layer
Physical Channels != Logical Channels
Broadcast Channels ­ Carry "Beacon" Information ­ Paging & signaling to idle devices ­ Unencrypted
Dedicated Channels ­ Communication to a specific UE(ME). ­ Often encrypted

GSM Encryption
A5/0 ­ No encryption, banned from many networks (i.e. Tmobile Austria)
A5/1 ­ Standard today
A5/2 ­ Export Version, broken 199
A5/3 + 4 ­ Backport of UMTS Katsumi based cipher

GSM Encryption

IMEI ­ IMSI - TMSI
International Mobile Equipment Identifier ­ The phone
International Mobile Subscriber Identifier ­ The SIM card (i.e., the user)
Temporary Mobile Subscriber Identifier ­ A temporary UserID / SessionID ­ (should) Prevent tracking since signaling plane is unencrypted

Attacks: TMSI deanonymization
­ TMSI deanonymization · Record Paging Traffic · Call known Number, hangup before full channel setup (=before starts ringing) · Use set of recorded pages to filter candidates ­ Aka sieve · Repeat until one candidate left

Attacks: Internet interconnectivity
­ GPRS tunneling over Internet · Publicly reachable tunnel endpoints have been found via port scanning at several Telcos
­ DNS infrastructure, · e.g., epc.mncxxx.mccxxx.3gppnetwork.org

Attacks: SIM Cloning
­ COMP128 weakness · Key derivation algorithm · Secret key recovery by analyzing thousands of responses
· SIM card cloning · Used via programmable multi-SIMs and
development SIM cards

Attacks: Decryption
­ GSM Cipher
· Rainbow tables available (~2TB) · Decode session key (eavesdropping) · In seconds...

Attacks: SS7
­ SS7 Attacks · "Signaling System 7" ­ Signaling Backbone within and between many Telcos
­ Telcos fully trust each other · e.g. Anytime Interrogation
­ Find cell ids (=location) of any phone · Share Session key in case of roaming, etc
­ Works also without roaming

Attacks: IMSI Catchers aka Stingray
Used for
­ Tracking users
­ Eavesdropping calls, data, texts
­ Man-in-the-Middle
­ Attack phone using operator system messages (e.g. Management Interface, reprogram APN, HTTP-Proxy, SMS/WAP-Server...)
­ Attack SIM (c.f. SIM card rooting, otherwise filtered by most mobile carriers), Attack Baseband
­ Geotargeting ads (e.g. SMS)
­ Intercept TAN, mobile phone authentication, ...

A Mobile Network

A Mobile Network with a Mobile Station

Location Areas

A wild IMSI Catcher appears..

A wild IMSI Catcher appears ­ Use UMTS/GSM Protocol; not very effective!

A Real Network
Source: Let me answer that for you, Golde et al., TROOPERS & USENIX

Cell tower density
Source: Sendekataster.at

"IMSI Catchers"

Identification only Retrive IMSI / IMEI / TMSI Reject Location Update Tracking
UMTS downgrade Blocking UMTS transmission Spoofing System messages

Traffic Man-in-the-Middle Hold in Cell Actively intercept traffic
­ Relay to real network ­ Active or passive
decryption
Hold but intercept passively Imprison in cell, so phone is not lost to a neighbor cell

"IMSI Catchers"
Source: Verfassungsschutz (via DuD 26, 2006)

IC: Car Installation
Source: Gamma Group

IC: Car Installation
Source: Gamma Group

Car Installation
Source: Gamma Group

IC: Car Installation
Source: Gamma Group

IC: Car Installation
Source: Gamma Group

Body IMSI Catcher
Source: Gamma Group

Only for Law Enforcement?

Known Producers ­ Rohde & Schwarz ­ Gamma Group ­ Ability ­ IAI Elta ­ Septier ­ Meganet ­ NeoSoft ­ Proximus ­ Cyttek ­...

DIY ­ USRP based
­ Kirstin Paget
· DEFCON 19 · US$1,500
­ D. Werhle
· Master's Thesis · Freiburg
­ B. Postl
· Master's Thesis · Vienna

How to catch an IMSI Catcher?

Artifact: Frequency

Unused or guard channel
· Only found in Full Scan
Announced neighbor freq., but unused

Detactability
­ Frequency plans
· e.g. radio regulatory
· Self created

· Careful not to create interference

Artifact: Cell ID

New CID/LAC needed
­ To provoke "Location Update Request"
­ Random?
­ Use real one not used in that geographical region

Detectability
­ Cell IDs are very stable
­ Cell Database (local)
· Also for frequencies
­ Correlation with GPS coordinates

Artifact: Location Update / Register

Just providing a better signal Is not enough
­ Timers, Hysteresis
­ Unpredictable radio environment
RF Jamming?
­ Forcing full scan

Detectability:
­ Watching noise levels

Artifact: UMTS handling

Downgrading to GSM

­ e.g. Mayer and

Detectability:

Wetzel, 2005 [1]

­ Noise and Signal

· GSM layer in most

levels

deployed UMTS

­ Database of

networks

regions where

­ (selectively)

UMTS is available,

Jamming

and GSM usage is

­ Downgrade LUR

unlikely

­ Others...

· Cell Database

[1] Mayer and Wetzel, "A man-in-the-middle attack on UMTS", ACM Workshop

on Wireless security, 2005

Downgrade 4G  3G  2G
Pre-authentication traffic is unprotected - includes GET_IDENTITY (IMSI, IMEI) Location Updates can be rejected unauthenticated
­ Needed for Roaming case
­ Reject cause: "You don't have a subscription for this service"

Encryption

Older IMSI Catchers:

Downgrade encryption to Detectability:

'none' (A5/0)

­ Cipher Indicator

A5/1 and A5/2 can be decrypted with rainbow tables
­ In realtime

· Feature request in Android, 2009, assigned 2013
­ Roaming!

A5/3 rolled out at the moment

­ IC will have to do active MITM again

Artifact: Cell Imprisonment

Networks provides up to 32 neighbor frequencies
­ MS stores typ. 6+1
­ Used for hand overs, LAR, ...
IC will likely provide an empty (eq.) NL
­ To not loose phone to a neighbor cell

Detectability: ­ Neighbor cell list

Traffic forwarding

a) relay via other MS ­ Loose caller ID ­ No incoming calls
b) via SS7 or similar ­ Caller ID correct ­ Loose incoming calls

c) recover secret SIM key
­ Impersonate to network with victims identity
Detectability: ­ Call tests (?)

Usage Pattern

Identification Mode ­ Short living cells
MITM Mode ­ Longer living cells

Both:
­ Unusual locations for cells

Cell capabilities and parameter fingerprinting

Cell capabilities & parameters
Organization of logical channels on physical channels Timeout values

Detectability:
­ Cell and network database

Can be different on each cell, but typically they are the same over the whole network
­ Differ between networks

Network Monitor Mode
9731-3006-8132-3476-9712

Detection Matrix

Two approaches

Mobile IMSI Catcher Catcher
­ Standard Android API
­ No need to root phone
­ No need for a specific chipset (e.g. GoldX)
­ Easy Interface

Stationary IMSI Catcher Catcher
­ Network of measuring stations
­ Good locations, larger coverage
­ Cheap
· RaspberryPi based

Mobile IMSI Catcher Catcher

Two approaches - Features

Mobile IMSI Catcher Catcher
­ GPS + Neighbor cell listing
· Geographical correlation
· Cell-IDs
­ Cell Capabilities
­ RF and NCL manipulations
­ Limited to NCL but mobile

Stationary IMSI Catcher Catcher
­ Cell-ID mapping
­ Frequency usage
­ Cell lifetime
­ Cell capabilities, network parameters
­ Jamming

Stationary IMSI Catcher Catcher

WIP: Network operator has no global view
Currently in a project with a major Austrian carrier ­ Finding IMSI Catcher based on operator data
Network operator has no global view ­ Some transactions are designed decentralized ­ One transaction can leave trace on many levels/protocols ­ 2G/3G/4G interaction grown historically ­ Monitoring solutions have to carry high load
· e.g. > 100K LUR/min
­ ...but still extract and correlate data meaningfully

Work in Progress

Verified with USRP based IMSI Catcher
­ Need commercial devices for testing
Build dense measurement network
­ Goal: 20-40 stations
Implement 3G + LTE

Android-APP ­ Fine tune ruleset for everyday situations ­ Problem zones:
· Tunnels · Underground

(Bachalor's and Master's) Thesis' opportunities
­ Port 2G broadcast sniffing to FPGA (BladeRF) ­ Implement 3G
· GNU Radio , SDR
­ Implement 4G
· GNU Radio, SDR
­ Implement client stack ­ More ideas?
Contact: dabrowski@seclab.tuwien.ac.at

