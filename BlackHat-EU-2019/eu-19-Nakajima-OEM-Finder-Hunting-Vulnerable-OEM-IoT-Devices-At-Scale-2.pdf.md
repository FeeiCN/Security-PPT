OEM Finder
Hunting Vulnerable OEM IoT Devices at Scale
Asuka Nakajima
NTT Secure Platform Laboratories

# whoami

Asuka Nakajima

@AsuNa_jp

http://kun0ichi.net

 Security Researcher @ NTT
o Vulnerability Discovery, Reverse Engineering, and IoT Security
· Speaker: BlackHatUSA 2019, AsiaCCS 2019, ROOTCON 2019, PHDays 2016
 Black Hat Asia Review Board
o From 2018 ­ 2020
 Founder of CTF for GIRLS
o First Female InfoSec Community in Japan
· Est. 2014.06

Background [1/4]

Many Consumer IoT Vendors Employ an OEM (Original Equipment Manufacture) Production Model

OEM Supply Chain (a.k.a White Label Model)

OEM Supplier (Brand A)

IoT Vendors

Network Camera

Vendor B OEM

[ Brand B ]

B

A
Original Device

Vendor C OEM
[ Brand C ]
C

Vendor D OEM

[ Brand D ]

D

Users
B C

Background [2/4]

While OEM Production Model Can Reduce the Device Manufacturing Costs, It Could Lead to a High-Security Risk

OEM Supplier (Brand A)
Network Camera
A
Original Device

IoT Vendors

Vendor B OEM

[ Brand B ]

B

Vendor C OEM
[ Brand C ]
C

Vendor D OEM

[ Brand D ]

D

Background [2/4]

While OEM Production Model Can Reduce the Device Manufacturing Costs, It Could Lead to a High-Security Risk

OEM Supplier (Brand A)

Network Camera

Vulnerable

A
Original Device

IoT Vendors

Vendor B OEM

[ Brand B ]

B

Vendor C OEM
[ Brand C ]
C

Vendor D OEM

[ Brand D ]

D

Background [2/4]

While OEM Production Model Can Reduce the Device Manufacturing Costs, It Could Lead to a High-Security Risk

OEM Supplier (Brand A)

Network Camera

Vulnerable

A
Original Device

IoT Vendors

Vendor B OEM

[ Brand B ]

B

Vendor C OEM
[ Brand C ]
C

Vendor D OEM

[ Brand D ]

D

Vulnerable Vulnerable Vulnerable

Background [3/4]

2017

CVE-2017-7921

Vulnerability found in the Hikvision's (OEM Supplier's) network camera was propagated to its various OEM devices
which are sold by over 80 vendors[1]

[1] 80+ OEMs Verified Vulnerable To Hikvision Backdoor, IPVM, Sep 22, 2017, https://ipvm.com/reports/hik-oem-vuln

Background [4/4]
e.g.) NVD, CVE
Vulnerability Databases Do NOT Include and Announce Vulnerable OEM Devices as One of the Affected Products

Preliminary Survey
 Investigated CVEs which are related to IoT Devices from 2002 mid 2018 by using NVD data feeds[2].
1. Searched CVE which include "firmware" or "camera" or nearly "router" or "modem" or router's name listed in [3] in the 2000 CVEs affected product/software name
2. Filtered out the CVEs which affects only one vendor, and then manually investigated all the CVEs
 Only 6 CVEs list the OEM devices
as one of the affected products
[2] NVD Data Feeds, https://nvd.nist.gov/vuln/data-feeds [3] Router Check Support, http://support.routercheck.com/

CVE-ID
CVE-2010-4230 CVE-2010-4231 CVE-2010-4232 CVE-2010-4233 CVE-2010-4234
CVE-2017-3216

Affected Vendors
OEM Supplier Vendor which sells the
OEM Product
Camtron Tecvoz

Zyxel

Huawei, Zteo, Mada,
Greenpacket,

Background [4/4]
e.g.) NVD, CVE
Vulnerability Databases Do NOT Include and Announce Vulnerable OEM Devices as One of the Affected Products

Preliminary Survey One of the Probable Causes
 Investigated CVEs which are
related to IoT Devices from 2002 -

CVE-ID

Affected Vendors
OEM Supplier Vendor which sells the
OEM Product

mid 2018 by using NVD data feeds[2]. CVE-2010-4230

1. Searched CVE which include "firmware" or "camera" or

CVE-2010-4231

Still No Means to Find the OEM Devices! nearly "router" or "modem" or router's name listed in [3] in the
2000 CVEs affected product/software name

CVE-2010-4232 Camtron

Tecvoz

2. Filtered out the CVEs which affects only one vendor

other than asking the OEM suppliers oCr iVnEs-p2e0c1t0in-4g2e3a3ch device manually

 Only 6 CVEs list the OEM devices

CVE-2010-4234

as one of the affected products

CVE-2017-3216

Zyxel

Huawei, Zteo, Mada,

[2] NVD Data Feeds, https://nvd.nist.gov/vuln/data-feeds [3] Router Check Support, http://support.routercheck.com/

Greenpacket,

How to Find OEM Devices

OEM Devices Share a Similar Appearance to the Original Device

CVE-2010-4230

CVE-2017-3216

Original Device
Vendor: Camtron
Model: CMNC-200

OEM Device
Vendor: Tecvoz
Model: CMNC-200

Original Device
Vendor: ZyXEL
Model: max308m

OEM Device
Vendor: Greenpacket
Model: ox350

Challenges

Typical Image Comparison Algorithms Do Not Work For Our Purpose

Challenges
1. OEM devices are sometimes customized
- e.g.,) Additional antenna, Different lens
2. Photo of OEM devices is sometimes taken in a completely different way than the original device
- e.g.) Different angle, Different light sources

Google Image Search
Original

Can not find the OEM Device (Tecvoz CMNC-300)

Approach

STEP1

STEP 2

STEP 3

STEP 4

Use Specific Object Recognition Algorithm (KAZE[4]) to Extract the Object Features (Keypoints)

Original Device Image
Hikvision / DS-2CD2232-I5

Target Device (OEM Device) Image
Trendnet / TV-IP312PI

[4] Alcantarilla, P.F., A. Bartoli, and A.J. Davison. "KAZE Features." ECCV 2012, Part VI, LNCS 7577. 2012, p. 214

Approach

STEP1

STEP 2

STEP 3

STEP 4

Use Specific Object Recognition Algorithm (KAZE[4]) to Extract the Object Features (Keypoints)

Original Device Image
Hikvision / DS-2CD2232-I5

Target Device (OEM Device) Image
Trendnet / TV-IP312PI

Approach

STEP1

STEP 2

STEP 3

STEP 4

Search & Match the Similar Keypoints by Using Manhattan Distance (L1 norm)
# of Matched Keypoints
Similarity = # of Original Device Keypoints

If Similarity < Threshold, move to the next image

Approach

STEP1

STEP 2

STEP 3

STEP 4

Construct a Relative Neighborhood Graph Based on the Matched Keypoints

Approach

STEP1

STEP 2

STEP 3

STEP 4

Construct a Relative Neighborhood Graph Based on the Matched Keypoints

Original Device Image

Target Device (OEM Device) Image

Approach

STEP1

STEP 2

STEP 3

STEP 4

Construct a Relative Neighborhood Graph Based on the Matched Keypoints

Original Device Image
Node

Target Device (OEM Device) Image
Node

* Labeled each matched keypoint as same label

Approach

STEP1

STEP 2

STEP 3

STEP 4

Construct a Relative Neighborhood Graph Based on the Matched Keypoints

Original Device Image
Node

Target Device (OEM Device) Image
Node

Approach

STEP1

STEP 2

STEP 3

STEP 4

Construct a Relative Neighborhood Graph Based on the Matched Keypoints

Original Device Image GA

Node

Edge

Target Device (OEM Device) Image GB
Node

Edge

* Above is just a sample image of the relative neighborhood graph. Not the actual example.

Approach

STEP1

STEP 2

STEP 3

STEP 4

Calculate the Structure Similarity By Using Shortest Path Graph Kernel

Original Device Image GA

Target Device (OEM Device) Image GB

Calculate the Similarity of the Graph
sim(GA, GB) =  sim( all-shortest-path(GA), all-shortest-path(GB))

Experiment Overview
GOAL
Verify That This Approach Can Find OEM Devices

Dataset
 IoT Device Image Dataset  Original Device Image Dataset
 Image of IoT Devices which OEM supplier sells

Original Device Image
CVE-20XX-XXX

IoT Device Images

Calculate Similarity

OEM!

Dataset [1/2]

 IoT Device Image Dataset

 Collected more than 54,000 network camera images from Amazon & Walmart

EC Website

Region

API

Target Category

# of Collected Images

Amazon

Amazon.com Amazon.jp

Product Advertising API
Product Advertising API

Dome Camera Bullet Camera Web Camera Dome Camera Bullet Camera* Web Camera

13433 7410 2114 541 1000 3277

Indoor Camera

23159

Walmart walmart.com

Open API

Outdoor Camera Wireless Camera

3651 247

TOTAL

Web Camera

3
54835

*Bullet Camera category is called "Standard Camera" in amazon.jp, but the category number is the same as Bullet Camera in amazon.com

Dataset [2/2]

 Original Device Image Dataset

 Collected more than 120 images of network cameras (from amazon.com) in
which vulnerabilities were discovered in this past two years from the four representative OEM supplier vendors

Vendor name # of CVEs

# of Products # of Collected Images

Hikvision

3

20

21

Dahua

5

75

80

Foscam

24

21

21

Wanscam

1

1

3

TOTAL

33

117

125

Experiment Result
Summary
 Found more than 180 unique vulnerable OEM device candidates which are sold by over 25 vendors
 Analyzed the latest firmware images of some of the OEM device candidates
 Confirmed that the detected devices are indeed OEM devices  Found that some of the OEM firmware images are still vulnerable

Case Study 1: Hikvision

Original

CVE-2017-7921 & CVE-2017-7923
OEM Device Candidates

Vendor: KT & C
Model:KNC-P3TR6XIR

Vendor: PNET
Model: PN-402EX

Vendor: PWS Security Vendor: LTS

Model: Unknonwn

Model: CMIP3032-28

Vendor: Orange Sources Model: Unknown

Model: ds-2cd2312-i

Vendor: P2P Security Vendor: HDView

Model: Unknown

Model: Unknown

Vendor: AVUE
Model:AV50HTWX

Vendor: CMPLE
Model:1287-N

Vendor:
Securtiy Camera King Model:IPOD-PR2EXIRE28

Case Study 1: Hikvision

CVE-2017-7921 & CVE-2017-7923

Original Device

OEM Device Candidate

Model: ds-2cd4132fwd-i(z)

Vendor: Panasonic
(brand name: advidia) Model:A-44-IR-V2

Case Study 1: Hikvision

Candidate Vendors Name
SPT Security Xinnrray (Xinray) Security Camera King HDView CMPLE Orange Sources Urban Security Group PWS Security CONDORD P2P Security
KT&C AVUE ANNKE CCTV Star Pnet Panasonic(advidia)

Listed on IPVM?
No No No No No No No No No No
Yes Yes Yes Yes Yes Yes

Possible to Collect Firmware from the official website?
X X X X
   No Web site No Web site No Web site
X   X X 

Case Study 2 : Dahua

Original Device

CVE-2017-9317 & CVE-2917-9315 OEM Device Candidates

Model

Vendor: iMaxCamPro Vendor:PWS Security

IPC-HDBW4831E-ASE Model:WEC-IP9-WiFi

Model: Unknown

Vendor: Night King Model:NK-6030G-4K

Vendor:
Urban Security Group
Model: USGDK8W405GAHBB56A

Case Study 3: Foscam

CVE-2018-6830 Original Device OEM Candidate Original Device

OEM Candidate

Model: FI9805W

Vendor: Skyreo
Model:
SR8905W-SLUS

Model: FI9900EP

Vendor: Ambient Weather Model: AMBIENTCAMHDA

Case Study 3: Foscam

Original Device

CVE-2018-6830 OEM Device Candidates

Model: FI9816P

Vendor: Vstarcam Model: C37A

Vendor: Escam Model: QF001

Vendor: Sricam Vendor: EVAKION Model: Unknown Model: EV130

Detailed Analysis

CVE-2017-9315

Original

OEM Candidate

Download Firmware (IMAX Cam Pro)

https://www.worldeyecam.com/iMaxCamPro-Firmware-Download-Page.html

A

unpack

Dahua logo !

Vulnerable Part !

Vendor:Dahua

Vendor: iMaxCamPro

B

Model:

Model:

SD52C430U-HNI

IMAX-CVI720P12X-PTZ-FM

Summary

 Confirmed that the OEM candidate devices are indeed OEM devices (A)

 Found that the OEM firmware images are still vulnerable (B)

DEMO Time!

OEM Finder

DEMDEOMO#1
Find and show vulnerable OEM device candidates by using the OEM Finder

Original Device

[ Vendor ] + Hikvision
[ Model ] + DS-2CD2232-I5
[ CVE-ID ] + CVE-2017-7923 / CVE-2017-7921

OEM Finder http://oemfinder.ilab.ntt.co.jp

About Other Consumer IoT Devices
Smart Speaker
Original ?

OEM ?

Vendor: COWIN Model: Dida

Vendor: ELEPAWL Model: Dida

Black Hat Sound Bytes
Take Aways

Black Hat Sound Bytes
 Explained About Security risk of consumer OEM IoT devices
1. When the original IoT device is vulnerable, the OEM device is also vulnerable 2. Vulnerability databases do not include the vulnerable OEM device as one of
the affected products
Developed a new tool called OEM Finder, which can automatically detect OEM device candidates based on the similarity of its appearance between the OEM and original device
· Adopt an object recognition algorithm, and employ a graph kernel algorithm
Published OEM Finder as an online search engine
· http://oemfinder.ilab.ntt.co.jp

Acknowledgement
Acknowledgment
 Team Members
o Takuya Watanabe, Eitaro Shioji, Mitsuaki Akiyama
o For insightful discussion
 Special Thanks
o Toshiki Shibahara
o For insightful discussion and his suggestion about employing graph kernel algorithm

Questions?

E-Mail Twitter

asuka.nakajima.db@hco.ntt.co.jp @AsuNa_jp

