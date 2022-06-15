SESSION ID: TECH-R11
What Every Security Professional Needs to Know About Wi-Fi 6

Dr. Avril Salter, CCNP-Wireless, CCNA-Security
IT training: wireless, network security, packet analysis Salter & Associates @AvrilSalterUSA

#RSAC

Session Outline
What I am Going to Talk About
Wi-Fi 6 ~ 802.11ax certification
­ Compare and contrast with
o 802.11n,ac o 5G
Security considerations
­ WPA3

#RSAC
Why You Should Care
Help you make decisions regarding your deployment or usage of these technologies You cannot secure what you do not understand

2

#RSAC
Where Wi-Fi is Particularly Problematic

Unplanned deployments

IoT traffic
3

High density of users

#RSAC
802.11ax Builds on 802.11ac
Spectrum efficiency Power efficiency
Operational efficiency
4

More Spectrum
2.4 GHz
­ 20 and 40 MHz channels

2.4-2.483

5.15-5.35 5.35-5.850

#RSAC
6 GHz band
­ FCC proposed new rules ­ Significant increase in unlicensed
spectrum ­ Over 1 GHz
5.925-7.125 GHz

5

Multiple Simultaneous Users
802.11ac Orthogonal Frequency Division Multiplexing
Single user transmission Collision avoidance mechanisms

#RSAC
802.11ax Orthogonal Frequency Division Multiple Access
Multiple simultaneous transmissions AP acts as a central controller
­ Allocation of subcarriers

Frequency Frequency

Time
6

Time

#RSAC
Reduces risk of collisions
7

Smaller Subcarriers
802.11ac
Subcarrier spacing 312.5 kHz 256 subcarriers in 80 MHz channel

#RSAC
802.11ax
Subcarriers spacing 78.125 kHz 1024 subcarriers in 80 MHz band

...
Channel bandwidth

...
Channel bandwidth
8

#RSAC
Devices are Allocated Resource Units (RU)
Smallest RU is 26 subcarriers

26 26

26 26

26 26 26

26 26

26 26

26 26

26 26

26 26 26

26 26

26 26

13 13 13 13 13

13 13 13 13 13

26 26

26 26

26 26 26

26 26

26 26

26 26

26 26

26 26 26

26 26

26 26

2

2

2

2

52

52

52

52

52

52

52

52

1

11

2

11

1

2

2

2

2

52

52

52

52

52

52

52

52

1

11

2

11

1

106

106

106

106

106

106

106

106

242 tone RU

242 tone RU

484 tone RU

242 tone RU

242 tone RU

484 tone RU

OFDM -- 996 tone RU

-400

-200

0

200

400

Illustration shows a 80 MHz Channel
9

OFDMA

#RSAC
Efficient for different services types
10

#RSAC
Longer Modulation Symbol Period

802.11ac
3.2 s symbol duration (TSYM)
­ 0.8 or 0.4 s Guard Interval (GI)
Modulation symbol

802.11ax
12.8 s symbol duration (TSYM)
­ 3.2, 1.6, 0.8 s Guard Interval
Modulation symbol

GI

TSYM

GI

TSYM

11

#RSAC
Improves probability of signal reception

#RSAC
Data Rate Efficiency

Spectral Efficiency for broadband clients
More bits per Hertz Increases from 433 to 600 Mb/s
Assumes a 80 MHz channel

5 FEC x

980 SC1 x 10 bits per SC

6

12.8 µs IFFT/FFT period + 0.8 µs GI

= 600 Mb/s

Robustness and power efficiency for IoT Devices
Allows clients to operate in 20 MHz only mode
Dual Subcarrier Modulation (DCM)

1 FEC 1 Rep

x

x

24 SC1 x 1 bits per SC

2

2

12.8 µs IFFT/FFT period + 3.2 µs GI

= 375 kb/s

13

#RSAC
Beamforming Enables Higher Level of Modulation

Omni directional antennas

Higher data rates at greater distances

Better battery performance for IoT devices

64-QAM 16-QAM
QPSK BPSK

1024- 256- 64QAM QAM QAM
1024-QAM Coverage with Beamforming
Actual coverage varies with RF conditions
14

BPSK

Advances in MIMO Technologies

802.11ac
DL MU-MIMO
­ 8x8 MIMO ­ Maximum of 4 stations

802.11ax
DL and UL MU-MIMO
­ 8x8 MIMO ­ Maximum of 8 station

Two spatial streams

Three spatial streams

One spatial stream

Two spatial streams
15

#RSAC
One spatial stream

#RSAC
Number of Simultaneous Multiplexed Users
MU-MIMO is supported on allocations sizes  106 subcarriers

RU size 26 52 106 242 484 996 2x996

20 MHz 9 4 16 8 ----

40 MHz 18 8 32 16 8 ---

80 MHz 37 16 64 32 16 8 --

160, 80+80 MHz 74 32 128 64 32 16 8
Assumes 8x8 MU-MIMO

16

#RSAC
Support dense environments
17

#RSAC
Operational Efficiency

Legacy Collision Avoidance

802.11ax Collision Avoidance

· STA A transmits to AP · STA B detects channel busy · Compares to CS threshold · Defers transmission

· STA A transmits to AP 1 · STA B detects channel busy · Compares to OBSS CS threshold · STA B initiated transmissions to AP 2 · At reduce transmit power

-35 dBm
1 frame

A

-68 dBm
B

2 -75 dBm

-35 dBm
1 frame
-92 dBm

A
-58 dBm
-68 dBm
B

2 -75 dBm
-44 dBm

19

#RSAC
Wi-Fi 6 802.11ax High efficiency
WLAN

#RSAC
Where Security is Particularly Problematic

Variety of cryptographic algorithms

Weak passwords
20

Open networks

#RSAC
WPA3: An Upgrade to WPA2

Encryption Authentication
Protected mgmt. frames (PMF)

WPA2

Personal Enterprise

128 AES 128 AES

PSK

802.1X

Not required

Not required

WPA3

Personal Enterprise

128 AES

192 AES

SAE

802.1X

Mandatory Mandatory

21

WPA3 Enterprise: Stronger Cipher Suites

Supplicant

Authenticator

PMK
Derive PTK (KCK, KEK, TK)

Beacon Authentication (Open) Association

EAP Authentication
PMK EAPOL-key (ANonce)

EAPOL-key (SNonce, MIC) EAPOL-key (Encrypted GTK, MIC)

Derive PTK (KCK, KEK, TK)

EAPOL-key (Ack, MIC)

22

#RSAC
Authentication server

#RSAC
I changed all my passwords to "incorrect"
Now when I forget, it tells me my
password is "incorrect".
23

Overcoming the Impact of Weak Passwords

WPA2-Personal

WPA3-Personal

Beacon (RSN AKM PSK) Authentication (open) Authentication (successful)
Association request (RSN PSK) Association response (successful) EAPOL (ANonce) EAPOL (SNonce, MIC) EAPOL (GTK, MIC) EAPOL (MIC)

Beacon (RSN AKM SAE)

Authentication (ECC/FFC, scalar, element)

Authentication (scalar, element)

Authentication (successful, confirm, hash)

Authentication (successful, confirm, hash)

Association request (RSN SAE)

Association response (successful)

EAPOL (ANonce)

EAPOL (SNonce, MIC)

EAPOL (GTK, MIC)

EAPOL (MIC)

24

Illustration shows STA initiating SAE

#RSAC

Wi-Fi CERTIFIEDTM WPA3TM
Released June 2018
­ Initially optional ­ Expected to become mandatory in future
WPA3 products
­ Certified products shipping 4Q 2018 ­ Broad adoption late 2019
o In conjunction 802.11ax products
Probably requires new hardware
­ Not a firmware or software upgrade
25

#RSAC
Early 802.11ax products lack
WPA3

#RSAC
Capture Traffic Transmitted on a Beam
MU-MIMO makes over-the-air captures of data traffic significantly more complex
­ Transmissions to multiple users ­ On same frequency channel ­ At the same time
Arguably more secure Possible attacks
­ Minimize use of MU-MIMO
o E.g. Disruptive interference
­ Listen on partial beam
26

#RSAC
Apply What You Have Learned Today

Wi-Fi 6 and WPA3 dense and IoT environments

Wi-Fi 6 and WPA3 evolutionary upgrades

Wi-Fi 6 and WPA 3 products starting
to ship

Capturing wireless traffic increasingly
difficult

Now

In a week

In 3 months In 6 months

Write down 2 or 3 things in this presentation most
relevant to you

Assess if Wi-Fi 6 and WPA 3 are important to your
organization

Check availability of Wi-Fi 6 and WPA3 certified equipment

Evaluate security impact of
legacy devices

27

#RSAC
Thank you for listening 
www.linkedin.com/in/avrilsalter Avril@dravril.com @avrilsalterUSA
28

#RSAC
WPA3-Enterprise TLS Cipher Suites
TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
­ ECDHE and ECDSA using the 384-bit prime modulus curve P-384
TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
­ ECDHE using the 384-bit prime modulus curve P-384 ­ RSA  3072-bit modulus
TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
­ RSA  3072-bit modulus ­ DHE  3072-bit modulus
29

#RSAC
Encryption for Open Wi-Fi Networks

Not part of WPA3
Opportunistic Wireless Encryption (OWE)

Beacon (RSN AKA OWE) 802.11 Authentication (Open) 802.11 Association Req (RSN AKA OWE, DH group/public key) 802.11 Association Res (RSN AKA OWE, DH group/public key) EAPOL (ANonce) EAPOL (SNonce, MIC) EAPOL (GTK, MIC) EAPOL (MIC)
30

