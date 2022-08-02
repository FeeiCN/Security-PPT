Industrial Protocol Gateways Under Analysis
Dr. Marco Balduzzi ­ @embyte
Joint work with: - Philippe Lin, Charles Perine, Ryan Flores, Rainer Vosseler from Trend Micro - Luca Bongiornias Independent Researcher

A complex ecosystem

Enterprise or cloud

Control (TCP/IP)

Field e.g. RS-232

Upper network

Medium network

Lower network

A simplified view. Can be more complicated than this!

Heterogeneous Protocols

Enterprise network

Control network

Field network

General

Increased demand for connectivity
 34.5% of control networks are connected to the Internet
 66.4% are connected to either
­ a third-party private infrastructure ­ or to their enterprise business network.
Reference: SANS State of OT/ICS Cybersecurity Survey (2019)

Ethernet

Protocol Gateway
10 cm
Serial Wireless

Typical installation

Protocol Gateway

Common Understanding

Reality

Tiny, cheap, embedded "piece of hardware"
Performs secondary tasks (not like an industrial robot)

Can actually run a fullyfledged system
It's actually core to the industrial network

Consequences
Overlooked, not indexed
Mis-configured, not patched, not monitored

Research Assumptions

Research Assumptions

Considered Gateways

Gateway Nexcom NIO50

Type Country Real-time Taiwan

Schneider Link 150 Real-time France

Interfaces Eth, Serial, Wifi Eth, Serial

Digi One IA Red Lion DA10D
Moxa MGate 5105MB-EIP

Real-time Data Station Data Station

USA USA
Taiwan

Eth, Serial Eth, Serial
Eth, Serial

Translations Transparent, Modbus (tcp/rtu/ascii), MQTT
Modbus (tcp/rtu/ascii), jbus, powerlogic
Transparent, Modbus (tcp/rtu/ascii) 300 drivers
Modbus (tcp/rtu/ascii), ethernetIP, MQTT

Type of Gateways
 Real-Time
­ Real-time approach: each incoming packet is immediately parsed, evaluated, and translated
 Data Stations
­ Asynchronous approach, e.g. do not wait for an incoming read to pull data our from a slave
­ Require the configuration of a sort of routing table: I/O Mapping Table

Approach to Research

Gateway Researcher

Test cases

Gateway

Fuzzer

Crash monitoring

Configuration

Researcher

Test cases

Gateway

Translated traffic

Fuzzer

Crash monitoring

Simulator

Configuration

Researcher

Test cases

Gateway

Translated traffic

Sniffer

Fuzzer

Crash monitoring

Inbound traffic

Analyzer

Outbound traffic

Simulator

Configuration

Researcher

Test cases

Gateway

Translated traffic

Sniffer

Fuzzer

Crash monitoring

Inbound traffic

Analyzer

Outbound traffic

Configuration

Researcher

Report

Simulator

Simulator

Simulator

Header

Payload

CRC

= 10101

Fuzzer
 Mutation-based: protocol learning
­ e.g., Radasma and PropFuzz
 Generation-based: known specs
­ e.g. BooFuzz and Sulley
 Based on (and credits to)
https://github.com/youngcraft/boofuzz-modbus

Fuzzer

Initialize Header
Payload Finalize

def write_single_coil(session):

Configuration:

s_initialize('write_single_coil')

- trailer

with s_block('adu'): s_incr('transId') s_word(0x0000, name='protoId', endian=cfg.endian, fuzzable=cfg.fuzz_proto_id)

- byte ordering - fuzzable fields

- recursive fields s_size('pdu', length=2, offset=1, name='length', endian=cfg.endian, fuzzable=cfg.fuzz_length)

s_byte(cfg.slave_id, name='unitId', fuzzable=cfg.fuzz_slave_id)

with s_block('pdu'):

s_byte(0x05, name='write_single_coil', fuzzable=cfg.fuzz_funct_code)

s_word(0x0001, name='address', endian=cfg.endian, fuzzable=cfg.fuzz_addrress)

if cfg.random_coil_value:

s_word(0x0000, name='outputValue', endian=cfg.endian, fuzzable=True)

else:

s_group(name='outputValue', values=['\x00\x00', '\xFF\x00'])

if cfg.trailing_garbage:

s_random('', cfg.gmin, cfg.gmax, num_mutations=cfg.gmut, name='trailing_garbage')

session.connect(s_get('write_single_coil'))

Instrumentation

target.procmon = boofuzz.instrumentation.External (pre=target_pretest, post=target_alive,
start=reset_target, restart=reset_target)

Connect(), ARP request, etc.. Reboot

Gateway
Transparent, Modbus, MQTT
Inbound and outbound interfaces Master and slave configuration

Ethernet Interface

Sniffer

Serial Interface

Payload acquisition (Modbus) +
Data normalization

Analyzer

 Automatically detects mismatches or packets drop

Real-time gateways configured as Modbus TCP Master + Modbus RTU Slave
1574704509.746888,TCP,00:01:00:00:00:06:01:00:00:01:00:01 1574704509.770035,RTU,01:00:00:01:00:01:91:CA

 Correlation:
­ Timestamp for real-time gateways
­ Nonce for data stations

1574704511.271468,TCP,00:02:00:00:00:06:01:01:00:01:00:01 1574704511.289164,RTU,01:01:00:01:00:01:AC:0A
1574704512.802031,TCP,00:03:00:00:00:06:01:02:00:01:00:01 1574704512.875859,RTU,01:02:00:01:00:01:E8:0A
1574704514.328139,TCP,00:04:00:00:00:06:01:03:00:01:00:01 1574704514.343510,RTU,01:03:00:01:00:01:D5:CA
1574704515.860150,TCP,00:05:00:00:00:06:01:04:00:01:00:01 1574704515.878557,RTU,01:04:00:01:00:01:60:0A

Example of Modbus TCP fuzzing

Example of Setup
Tap

Findings

Resource Exhaustion
 Affects all tested devices
 Hang of the TCP/IP stack  Hang of the translation
process

Power socket console

Targeted DoS

 Reboot for:
­ read_coils(0) ­ read_inputs(0) ­ read_registers(0)
 Demo: Red Lion DoS

redlion_reboot.mp4

Protocol Translation Bypass

Modbus TCP Modbus RTU

Nexcom NIO50 0.00
25.47

Schneider Link 150
32.66
23.73

Digi One IA
29.98 9.36

Radio of filtered malformed packets

One of this packets is the following (read input registers)

Transaction Protocol Message Unit Function Starting

ID

ID

Length ID

Code Address

010F

0000

0011

03

04

D1CE

Number of Registers
0070

PDU is 0x0006 bytes long

No translation, but forwarding

Demo: Nexcom Attack Chain
nexcom_attack_chain.mp4

Data Stations

Arbitrary R/W Vulnerability
 Given fact (weird): address in inbound message used as index in mapping table
 Out-of-bound write  No check of function code
write (x)  where x is anywhere in table

Impact
 Arbitrary read and writing  Example: write coil to write to an address
mapped to a different command
write coil  write register write register  write coil write multiple coils  N*(write coil) + M*(write register)

Attack Example
 Change protected parameter "Critical
Threshold"
 Case 1: very high value  disable alarm / damage production
 Case 2: very low value  trigger false positive

Demo: Moxa Attack Chain
moxa_{camera,screen}.mp4

To sum up

Trans Proto ID ID
0001 0000
0001 0000

Message Length
0006
0006

Unit ID
01 01

Function Register Code Address

06

0001

05

0016

Register Value
47D0
FF00

Correct Abuse

Technique to leak the I/O Mapping
Table

1: Token Credential Reuse

 Admin password encrypted with guessable nonce

Ask nonce Nonce Auth

1: Token Credential Reuse

 Lack of random seed in initialization in

sdc_dscid()

if ( !(v6 | v5) ) { v11 = rand(); s.tv_sec = 67109120; [...] s.tv_usec = v11; sub_10E6C((int)"get_challenge", v3, &s, 8u); return dword_1C98C; }

 Token reuse after reboot, re-config or update  Grants full device access (not only I/O table)

2: Decryptable Configuration

2: Decryptable Configuration

2: Decryptable Configuration
From MOXA firmware
Firmware Decryption as per https://www.ghidra.ninja/posts/02-moxa-firmware-encryption/

3: Authenticated Privilege Escalation
Unpriviledged user

4: Memory Leakage

 Leaks memory data in form of:
­ write multiple registers sent to the slave ­ leaked data automatically read back
 Example of attack payload

Slave ID
01

Function code
10

Starting address
0000

Number Number of registers of bytes

0004

00

Data

 Amount = "Number of registers to write" * 2
­ For example: 0x0004*2 = 8 bytes ­ The maximum amount leaked at once looks like 16
 Address = f("starting address"), i.e. predictable

Other translation problems
 Cloud translation:
­ Lack of encryption, lack of sanitization, broken auth
 Availability:
­ IP change via magic packet
 Different implementation of the specs  Etc... (ref. paper)

Cloud Support

MQTT
 Data leakage
­ No support for encryption, or disabled by default
 Broken authentication

MQTT
 Forwarding of arbitrary data blobs including attack payloads for the backend
SQLi on backend

Other security issues
 Bonus: identified following side problems:  DoS: IP change via "magic packet"  Different implementation of the protocol
specifications
­ E.g., unit identifier field is half byte instead of one
 Firmware with hard-coded password

Recommendation & Conclusions
 Consider security as an important aspect in product selection
 Do not rely on a single point of control / failure, e.g. ICS firewall
 Correct configuration and management. Even if small, embedded devices  big problems

Appendix: List of reported vulns
 Reported via the Zero Day Initiative (ZDI) and with the support of ICS-CERT

Thank you! Questions?
@embyte / paper1
[1] Copy of paper available at http://www.madlab.it/papers/protogw.pdf
Joint work with: - Philippe Lin, Charles Perine, Ryan Flores, Rainer Vosseler from Trend Micro - Luca Bongiornias Independent Researcher

