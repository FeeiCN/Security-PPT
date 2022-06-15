SESSION ID: ACB-W01
Entropy as a Service: A Framework for Delivering High-quality Entropy

Ravi Jagannathan
Security Architect VMware

David Ott
Sr. Staff Researcher and Academic Program Director VMware
#RSAC

#RSAC
The Problem of Weak Entropy
N. Heninger, Z. Durumeric, et al. "Mining Your Ps and Qs: Detection of Widespread Weak Keys in Network Devices". USENIX Security 2012.

#RSAC
The Problem of Weak Entropy

[09] CVE-2000-0357 : ORBit and esound in Red Hat

[18] CVE-2008-0141: WebPortal CMS generates

pseudo-random number generator (PRNG) before

Linux do not use sufficiently random numbers, December predictable

allowing a child process to access it, October 2013.

1999.

passwords containing only the time of day,

[27] CVE-2013-4442: Password generator (aka Pwgen)

[10] CVE-2001-0950: ValiCert Enterprise Validation

January 2008.

before 2.07 uses weak pseudo generated numbers

Authority uses insufficiently random data, January

[19] CVE-2008-0166: OpenSSL on Debian-based operating when /dev/urandom is unavailable, December

2001.

systems uses a random number generator that

2013.

[11] CVE-2001-1141: PRNG in SSLeay and OpenSSL

generates predictable numbers, January 2008.

[28] CVE-2013-5180: The srandomdev function in

could be used by attackers to predict future

[20] CVE-2008-2108: GENERATE SEED macro in php

Libc in Apple Mac OS X before 10.9, when the

pseudorandom

produces 24 bits of entropy and simplifies brute

kernel random-number generator is unavailable, produces

numbers, July 2001.

force attacks against the rand and mt rand functions,

predictable values instead of the intended random

[12] CVE-2001-1467: mkpasswd, as used by Red Hat

May 2008.

values, October 2013.

Linux, seeds its random number generator with its

[21] CVE-2008-5162: The arc4random function in

[29] CVE-2013-7373: Android before 4.4 does not properly

process ID, April 2001.

FreeBSD does not have a proper entropy source for a arrange for seeding of the OpenSSL PRNG,

[13] CVE-2003-1376: WinZip uses weak random number short time period immediately after boot, November April 2013.

generation for password protected ZIP files, December 2008.

[30] CVE-2014-0016: tunnel before 5.00, when using

2003.

[22] CVE-2009-0255: TYPO3 creates the encryption key fork threading, does not properly update the state

[14] CVE-2005-3087: SecureW2 TLS implementation

with an insufficiently random seed, January 2009.

of the OpenSSL pseudo-random number generator,

uses weak random number generators during generation [23] CVE-2009-3238: Linux kernel produces insufficiently March 2014.

of the pre-master secret, September 2005.

random numbers, September 2009.

[31] CVE-2014-0017: The rand bytes function in libssh

[15] CVE-2006-1378: PasswordSafe uses a weak random [24] CVE-2009-3278: QNAP uses rand library function before 0.6.3, when forking is enabled, does not

number generator, March 2006.

to generate a certain recovery key, September 2009.

properly reset the state of the OpenSSL pseudorandom

[16] CVE-2006-1833: Intel RNG Driver in NetBSD may

[25] CVE-2011-3599: Crypt::DSA for Perl,

number generator, March 2014.

always generate the same random number, April

when /dev/random is absent, uses the

[32] CVE-2014-4422: The kernel in Apple iOS before

2006.

data::random module, October 2011.

8 and Apple TV before 7 uses a predictable random

[17] CVE-2007-2453: Random number feature in Linux [26] CVE-2013-1445: The

number generator during the early portion of

kernel does not properly seed pools when there is no crypto.random.atfork function in Py-

the boot process, October 2014.

entropy, June 2007.

Crypto before 2.6.1 does not properly reseed the

H. Corrigan-Gibbs and S. Jana. "Recommendation for Randomness in the Operating System, or, How to Keep Evil Children Out of Your Pool and Other Random Facts". HotOS 2015.

#RSAC
Agenda
· Entropy · NIST EaaS · VMware Suggested Improvements · Experiments · Future Work
4

What is entropy?
Entropy: def
· a measure of randomness, unpredictability · more entropy => harder for adversary to guess
More precisely: Number of information bits not known to an adversary
· k bits of entropy · Max 2k guesses needed to find a value (assuming
uniform distribution)

#RSAC
Example: k = 8 bits Max 256 guesses to find value
Example: k = 32 bits Max 4,294,967,296 guesses to find value Example: k = 64 bits Max 18,446,744,073,709,551,616 guesses to find value

#RSAC
Entropy Sources

Entropy Source: · a noise source · sampling and quantization · minimal conditioning (e.g.,
unbiasing)
Key questions: · Does the entropy show statistical
bias? · Is it unpredictable and without
pattern? · Has enough entropy been
collected per sampled output?

Physical processes · thermal noise from a resistor · ring oscillators
Quantum · photons
Clock drift
OS subsystems · network packets · disk seek times
User processes · mouse movements · keyboard stroke timings

A. Vassilev and T. Hall. "The Importance of Entropy to Information Security". IEEE Computer. February 2014.

#RSAC
RBGs: Conditioning and Testing

NIST Oversampling NRBG Construction

NIST Entropy Source Model

DRBG = Deterministic Random Bit Generator
· a.k.a., Pseudorandom Number Generator (PRNG) · Input: random seed value · Output: sequence of random values with uniform
distribution · Sequence is deterministic (same for given seed) · E.g., hash function, block cipher

NIST SP 800-90B, "Recommendation for the Entropy Sources Used for Random Bit Generation". January 2018. NIST SP 800-90C, "Recommendation for Random Bit Generator (RBG) Contstructions. April 2016.

#RSAC
RBGs: Conditioning and Testing

NIST Random Bit Generator (RBG)

NIST Distributed RBG

NIST SP 800-90B, "Recommendation for the Entropy Sources Used for Random Bit Generation". January 2018. NIST SP 800-90C, "Recommendation for Random Bit Generator (RBG) Contstructions. April 2016.

#RSAC
Validation: How do you know you have it right?

Health Tests:
· Startup tests · Continuous health tests · On-demand health tests
Applied to:
· Entropy source · Output of conditioning function
Special cases

· Repetition Count Test · P(identical values) from C consecutive samples  
· Adaptive Proportion Test · Test if value frequency within window size W  threshold
· IID Tests · Test whether values are independent and identically distributed
· Min-Entropy Estimation · Determine how much entropy in a noise source sample

What's hard?
Entropy Source
· What to use as an entropy source? · Is the entropy rate adequate? · How do you know?
Continuous health tests
· Do you have enough samples? · Is the device capable of doing the
calculations?

#RSAC
Problematic Platforms: · IoT devices · Cloud computing ­ lack sources of non-
determinism · Systems administrated by non-experts · Platforms/applications requiring a large
amount of entropy

#RSAC

Entropy as a Service (EaaS)
Entropy Server

· Quantum entropy source provides

continuous random data to FIFO buffer

Proposal:

in memory · Responds to client requests by

· High entropy random data available as service over the network.

removing random values, encrypting, sending to client

· Provably robust entropy source

· Secure delivery
· Serves large number of needy devices

Client Devices
· Request and consume entropy (key establishment, nonces, authentication)
· Dedicated software protected by trusted hardware (e.g., TPM, Arm TrustZone)

A. Vassilev and R. Staples. "Entropy-as-a-Service: Unlocking the Full Potential of Cryptography". IEEE Computer. September 2016.

#RSAC
EaaS Architecture
A. Vassilev and R. Staples. "Entropy-as-a-Service: Unlocking the Full Potential of Cryptography". IEEE Computer. September 2016.

EaaS: Request/Response Protocol
NIST:
· HTTP GET request · XML response with encrypted, signed
payload · NTP timestamps prevents replay attacks
Our suggestion:
· HTTP over TLS (HTTPS) GET request · Eliminate NTP · JSON response from server
A. Vassilev and R. Staples. "Entropy-as-a-Service: Unlocking the Full Potential of Cryptography". IEEE Computer. September 2016.

#RSAC

EaaS Req/Rsp: HTTP over TLS (HTTPS)

TLS 1.3 (or 1.2 for now)
Authentication Encryption Replay protection

· Leverage standard implementation · Connection-level encryption handles
need to encrypt entropy · TLS 1.3 reused for secure data exchange
and EaaS.

Bootstrapping? Solutions:
o Pre-configured symmetric key (AES) o Pre-configured entropy bits o Weak entropy source, but used only
for brief initial time window

TLS 1.3 handshake
E. Rescorla. "The Transport Layer Security (TLS) Protocol Version 1.3". IETF RFC 8446. August 2018.

#RSAC

EaaS: JSON Response
JSON Advantages (over XML)
o Open standard (RFC 8259) while XML schemas tend to be custom/proprietary
o Widely implemented and portable o Support for array objects o Easier to parse, less computation, highly
optimized these days o Shorter (less verbose)

XML Example: <response>
<entropy> encrypted base64-encoded
</entropy> <timestamp>
ts here </timestamp> <digital sig>
sig here </digital sig> </response>
JSON Example: {
"Client Knock": [ { "client Identity":"VMware" }, { "Entropy need":"2048 bits" }, { "Number of Requests":"4" }
] }

#RSAC

15

EaaS: Entropy Source
NIST:
· True RBG = True Random Bit Generator (e.g., quantum device) · SP 800-90B compliant · Continuous monitoring solution
Client Entropy Usage:
· IoT device: May not trust underlying entropy source · VMs/Containers in cloud: Cloning replicates DRBG state, requires reseeding · Mixing function can be used to combine weak entropy with high-quality
EaaS entropy, or to mix entropy sources

#RSAC

Client Device

Entropy Server

#RSAC
EaaS Scaling Experiments

Dell Power Edge R940 (56 core, 256 GB DRAM, 100 GB ethernet)
Ubuntu Linux 18.04

/dev/random RDRAND

Mixing Function

Entropy Buffer

Server NIC

Entropy Source

Entropy Buffer

Entropy Server

Multithreaded client device emulation

Libc rand(void) Entropy Source Configuration

Client
17

#RSAC
EaaS Scaling Experiments: Single Server
Shows:
Number of IoT devices that entropy source can support Performance impact of CPU pinning
Setup notes:
Memory buffering between emulated devices and EaaS server. All network effects removed
18

#RSAC
EaaS Scaling Experiments: 2 Servers, Network Connection
Shows: Number of IoT devices that can be comfortably supported over a network
Setup notes:
Includes 100 Gbps network between EaaS server and emulated IoT devices But, no appreciable transmission time, queuing delay, congestion effects
19

#RSAC
EaaS Scaling Experiments: Client boot time entropy

Setup Notes:

EaaS Server 1 Entropy sources: TPM and Network traffic

EaaS Server: running VMware ESXi

Clients: VMware Photon OS running on ESXi

Client Server 1 24 Cores 24 cloned VMs (Photon OS)

EaaS Server 2 Entropy sources: RDSEED, Interrupt, Network traffic

EaaS Server 3 Entropy sources: RDRAND and Disk Interrupt

10 Gbps network

Client Server 2 24 Cores 128 cloned VMs (Photon OS)
20

Client Server 3 48 Cores 256 cloned VMs (Photon OS)

Client Server 4 48 Cores 1024 cloned VMs (Photon OS)

#RSAC
EaaS Scaling Experiments: VM clone boot time entropy
Time to accumulate 256 bits of entropy after boot

EaaS Entropy Source Single Entropy

Dual Entropy

Source (Interrupts) Sources (Interrupts,

network)

Cloned VMs on 2.6 GHz Time required for

core

entropy accumulation

from EaaS

Time required for entropy accumulation from interrupts

Time required for e.a. from interrupts and network traffic

24 cores / 24 clones

65 ms ­ 300 ms

1.0 ­ 1.8 sec

600 ms ­ 900 ms

24 cores / 48 clones

72 ms ­ 800 ms

1.2 sec ­ 2.6 sec

714 ms ­ 1.9 sec

48 cores / 256 clones 96 ms ­ 1.2 sec

1.7 secv­ 9.0 sec

1.2 sec ­ 7.0 sec

48 cores / 1024 clones 147 ms ­ 5.1 sec

5 sec ­ 220 sec

12 sec ­ 140 sec

Q: How long does it take for a PhotonOS Cloned VM to get 256-bit entropy seed?
21

#RSAC
Future Work
Error Conditions
· Need more comprehensive treatment
Testing
· Production environments
IoT devices
· Testing scheme with real IoT devices
22

#RSAC
Apply What You Have Learned
What are your device case studies?
Especially in 5G and cloud environments
Critical steps for EaaS adoption:
· Updating 800-90B in recognizing EaaS as an entropy source · Formal procedure to validate EaaS service
Or existing entropy test & justification procedure is good enough?
· Experience in running EaaS service
This experiment falls under this bucket Select a security system which allows proactive policy to be set according to your organization's needs Drive an implementation project to protect all critical databases
Can you help with EaaS JSON command set definitions?
23

#RSAC
Acknowledgment
Apostol Vassilev
Research Team Lead Security Test, Validation and Measurement Group NIST
Robert Staples
Security Test, Validation and Measurement Group NIST
IEEE Computer, vol 49, no 9. September 2016.

#RSAC
Thank You!

#RSAC
Abstract
Weak or poorly designed entropy sources undermine the strength of cryptographic protections in IoT communications and cloud. Entropy as a Service (EaaS), a framework developed in collaboration with NIST, offers a practical and effective solution. We discuss how the solution works to make high-quality entropy widely available to devices or systems lacking robust entropy sources.

