SESSION ID: TECH-R02
Six Things Security Professionals Need to Know About Wireless

Dr. Avril Salter, CCNP-W, CCNA-S
Chief Wireless Architect Salter & Associates @avrilsalterUSA

#RSAC

#RSAC
What we are going to discuss

 New wireless mechanisms

Implication to analyzing wireless traffic and network security

 Illustrations are Wi-Fi

Concepts apply to Wi-Fi and mobile networks

 Wi-Fi operates in licenseexempt spectrum
Mobile networks operates in licensed spectrum

Regulations and laws on spectrum usage differ

2

#RSAC
Protocol and spectrum analyzers

Protocol analyzer

Spectrum Analyzer

3

#RSAC
Why you need both

Packet Analyzer

Spectrum Analyzer

 Need to know what is on the network

 Need to know what is using the physical medium

 To see what exactly is going on with the network at a protocol level
 Inappropriate use of bandwidth
 Find potential intruders

 To see what is exactly going on with the network at the physical layer
 Find interference
 Find potential rogue devices

4

#RSAC
Tools for analyzing traffic over-the-air
5

#RSAC
Transition to MIMO

Mechanism Spatial Multiplexing Space Time Coding
Beamforming
Multi User-MIMO

Performance advantage Higher data rates
Improves SNR - Coverage Extends the range where higher data rates can be attained Increases throughput

6

Defining MIMO
Input into the RF medium
n transmit antennas

#RSAC
Output from the RF medium
m receive antennas

... ...

Multiple Input antennas

+

Multiple Output

antennas

= n x m MIMO

7

Spatial Multiplexing

2x2 MIMO
S1 S2

3x3 MIMO
S1 a11 S1 + a12 S2
S2 a21 S1 + a22 S2
S3

#RSAC
a11 S1+ a12 S2 + a13 S3 a21 S1 + a22 S2+ a23 S3 a31 S1 + a32 S2+ a33 S3

MIMO Mapping MIMO Mapping

8

#RSAC
Implications to security professionals
How many receiving antennas do you have?
9

#RSAC
Defining beamforming
Source: http://people.rit.edu/andpph/photofile-c/splash-water-waves-4565.jpg
10

#RSAC
Creating radiation patterns
 In theory
N * (N - 1) beams N - 1 nulls
g1Ø1 g2Ø2 g3Ø3 g4Ø4 g5Ø5 g6Ø6 g7Ø7 g8Ø8
11

#RSAC
Antenna reciprocity
It is common practice to describe antenna characteristics from the perspective of the transmitter
12

#RSAC
Multi-User MIMO
 If subscribers are spatially separated
 Create two beams using the same channel  Increases capacity
Users can hear their signal, can you!
13

#RSAC
Implications to security professionals
 Over-the-air captures are significantly more complex
 Arguably wireless is more secure  Hackers would need techniques that minimize use of MU-MIMO
 E.g. Disruptive interference
 Spectrum and packet captures shift to the network
 Access Point (AP) / Base Station (BS)
14

#RSAC
Transition to cloud computing

Cloud managed WLANs  Eliminates specialized equipment
 Configure and manage thru a browser interface

Cloud radio access networks
 Virtualization of the base station
 Enables new deployment scenarios  Benefits of the data center realized at
the network edge  Shared resources  Leverage general purpose processors  Moves content and applications closer to the end user

15

#RSAC
Cloud Radio Access Network (C-RAN)

BS AP ... Sec Pkt

app app

app tool

Real time/non-real time OS

Virtualization environment
Server platform General Purpose Processors

16

#RSAC
Six things you need to know
 You need both a packet and a spectrum analyzer  You need to know how many receiving antennas you have  Beamforming is happening, and will impact your ability to eavesdrop  MU-MIMO enables multiple transmissions in the same frequency channel
 Making eavesdropping over-the-air extremely difficult  Wireless networks are transitioning to a cloud / virtualization based
architecture  Wireless spectrum and packet traffic analysis on the wireless AP/BS is of
increasing importance
17

#RSAC
What you should do now
 Get and become familiar with using spectrum and packet analyzers
 Understand the limitations of the antenna technologies you are using for analyzing over-the-air traffic
 Check to see if your organization is implementing wireless cloud based solutions
18

#RSAC
Thank you for listening 
www.linkedin.com/in/avrilsalter @avrilsalterUSA
19

