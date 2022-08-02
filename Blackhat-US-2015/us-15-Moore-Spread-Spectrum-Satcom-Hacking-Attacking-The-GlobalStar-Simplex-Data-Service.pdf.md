Spread Spectrum Satcom Hacking
Attacking the Globalstar Simplex Data Service
Colby Moore @colbymoore - colby@synack.com

Who am I?
Colby Moore Synack R&D

Motivation
· Rehashes of same talks · Satellite hacking talks never deliver · RF world not heavily explored · So many of these systems are broken · I want to inspire and collaborate on research in this
department

What are we going to learn?
· Basics of RF signals and modulation · What is spread spectrum · Selecting a target and reverse engineering · Exploiting that target

Prerequisites
· Keeping things "understandable" · High school mathematical knowledge · Will provide resources

Waves
y(t) = A * sin(2ft + )
· A - Amplitude · f - Frequency (radians/second) ·  - Phase (radians)

Time Domain vs. Frequency Domain

Analog RF Modulation

Analog RF Modulation

Digital RF Modulation
· Amplitude Shift Keying (ASK / OOK) · Frequency Shift Keying (FSK) · Phase Shift Keying (PSK)

Phase Shift Keying (PSK)

IQ Modulation
· Makes modulation easy in software!

Spread Spectrum Modulation
· Why is Spread Spectrum Special? · WiFi, Bluetooth, Basically all modern RF
Communications · Processing Gain · Jam Resistant · CDMA

Spread Spectrum
· Frequency Hopping Spread Spectrum (FHSS) · Direct Sequence Spread Spectrum (DSSS)

DSSS
· Direct Sequence Spread Spectrum (DSSS)

Selecting a Target

· SPOT - Consumer grade satellite tracking · But wait... this tech is used everywhere. Goldmine. · Voice, data, messaging, etc.

Stuck in the 90s
"Error 100: Database query failed retrieving login information You have an
error in your SQL Syntax;..."

"The received data is then forwarded to a user defined network interface that may be in the form of an FTP host or HTTP host where the user will interpret the data for further processing."
­Globalstar

Simplex data network
"Simplex Works where infrequent, small packets of data are to be collected"

Coverage
48 satellites 5850 km diameter footprint
1410 km orbit In service since 2000

Ground Stations
Hundreds of ground stations

Command Centers

Where is it used?
Military / Classified Trailers / Containers Air Quality Monitoring Personnel Tracking Fire Detection and Prevention Water Quality Monitoring Tank Level Gauging Perimeter / Border monitoring Asset / Vehicle Tracking
Remote Meters Buoys
Ship Movement Fishing vessel monitoring
Power line monitoring Dispersed sensors

Bent Pipe
"A bent pipe satellite does not demodulate and decode the signal. A gateway station on the
ground is necessary to control the satellite and route traffic to and from the satellite and to the
internet."

Beam Pattern

Frequency Range

STX-3
Worlds' smallest and lowest power consuming industrial-use satellite transmitter

Intelligence Gathering
· Google · FCC Database · Academic Papers · Integrator Spec Sheets

Intelligence Gathering Continue
· 1.61125 ghz · 100 bit/second BPSK signal · Spread using 255 Chip M-Sequence · 144 bit message

M-Sequences and PN Codes

Hardware and Validation
· USRP B200 · GQRX and GNURADIO

Antennas
· Left Hand Circular Polarized

Decoding Theory
· Simple in practice. More difficult in theory · Re-Mix signal with PN sequence and the BPSK
signal will drop out. · Signal needs to be aligned with PN code · Compensate for frequency differential between
local and remote oscillators

Decoding / PN Recovery
· Remember that BPSK spread with DSSS == faster BPSK
· PN Sequence is much shorter than bit length (49x) · Since PN is repeats for each bit · PN xor Data == PN

Decoding Continued
· Shortcut: Decode DSSS as BPSK · We receive none of the processing gain, but its
perfectly legitimate.

Sampling
· Nyquist Theorem · Sampling Requirements:
· > 2x faster than 1.25 mhz · Even multiple of 32mhz · Even samples / symbol

Code Tracking

Code Tracking Cont.

Despread Signal

Packet Format

Packet Format Contd.
· There is no signing, no encryption · We can create packets if we known how to
reproduce the checksum · Reverse engineering the checksum

Message Decoding

Video Demo

But Wait, There's More

Questions?

Images
https://upload.wikimedia.org/wikipedia/commons/9/99/Lfsr.gif http://www.mccauslandcenter.sc.edu/CRNL/wp-content/ upLoads/nyquist.png
https://awrcorp.com/download/faq/english/questions/images/ iq_mod_dmod.png
http://ironbark.xtelco.com.au/subjects/DC/lectures/7/
http://www.mdpi.com/sensors/sensors-14-03172/ article_deploy/html/images/sensors-14-03172f5-1024.png
https://www.tapr.org/images/ssfig1.gif

