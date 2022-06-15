SmokeLoader
Historical Changes and Trends
Marcos Alvares
Technical Analysis Cell

I. Context

1

Botconf 2022 - Nantes, FR

Success Factors

2

Botconf 2022 - Nantes, FR

Success Factors
§ Business model § Cost § Complexity § Professionalism

3

Botconf 2022 - Nantes, FR

Success Factors
§ Business model § Cost § Complexity § Professionalism

4

Botconf 2022 - Nantes, FR

Success Factors
§ Business model § Cost § Complexity § Professionalism

Binary + Panel + Modules

5

Botconf 2022 - Nantes, FR

Success Factors
§ Business model § Cost § Complexity § Professionalism

Core Extensions

Anti-Analysis

Persistence

Network

Crypto

Payload Injection

Plugin mgt

6

Botconf 2022 - Nantes, FR

Operational
Initial Recon · Modules

Data Harvesting · InfoStealer

Final Payload
· Banker · Ransomware · RAT

7

Botconf 2022 - Nantes, FR

Operational
Initial Recon · Modules

Data Harvesting · InfoStealer

Final Payload
· Banker · Ransomware · RAT

8

Botconf 2022 - Nantes, FR

Operational
Initial Recon · Modules

Data Harvesting · InfoStealer

Final Payload
· Banker · Ransomware · RAT

9

Botconf 2022 - Nantes, FR

II. Code & Tactics

10

Botconf 2022 - Nantes, FR

Tactics - Starting Point

2011

2013

2012

2014

2015

2016

2017

2018

2019

2021

2020

2022

11

Botconf 2022 - Nantes, FR

Tactics - Starting Point

2011

2013

2012

2014

2015

2016

2017

2018

2019

2021

2020

2022

12

Botconf 2022 - Nantes, FR

Tactics - Starting Point

2011

2013

2012

2014

2015

2016

2017

2018

2019

2021

2020

2022

falcononfly2006[.]ru falcononfly2007[.]ru

91.229.90[.]139 (UA - 2011)

13

Botconf 2022 - Nantes, FR

Tactics - Starting Point

2011

2013

2012

2014

2015

2016

2017

2018

2019

2021

2020

2022

falcononfly2006[.]ru falcononfly2007[.]ru

91.229.90[.]139 (UA - 2011)

livegroup128[.]ru

14

Botconf 2022 - Nantes, FR

Tactics - Beta

2011

2013



2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ UPX § svchost.exe § Checks connection § HTTP § XOR encrypted DLLs

BEACON
GET /blog/task.php bid=344e17c07cbae8ce&os=6-17601&uptime=0&rnd=164239896

15

Botconf 2022 - Nantes, FR

Tactics

2011

2013



2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ "getload" command § "SmokeLoader" mutex § Commercial version

BEACON
GET /m07/index.php cmd=getload&login=248B0241860741F51&s el=2495&ver=&bits=0

16

Botconf 2022 - Nantes, FR

Tactics

2011

2013

2015

2017



2019

2021

2012

2014

2016

2018

2020

2022

§ Replaces SL Mutex § "s2k13" § Updates protocol

BEACON
GET / cmd=getload&login=65070D1A4B443C2637F ED4E852F9D9F27CBAE8CE&sel=sel2&ver=6. 1&bits=0&admin=1&hash=

17

Botconf 2022 - Nantes, FR

Tactics

2011


2013

2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ explorer.exe § "s2k14"

BEACON
GET / cmd=getload&login=65070D1A4B443C2637FED4E 852F9D9F27CBAE8CE&sel=sec6&ver=6.1&bits=0& admin=1&hash=

18

Botconf 2022 - Nantes, FR

Tactics

2011


2013

2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ Encrypts resources § HTTP POST § Placeholders § RC4

BEACON
POST /
4 Bytes RC4 key + RC4(
2015#DFC547E8B4F619DE561270009ECB1 ACF7CBAE8CE#00015#6.1#0#0#10001#0#
)

19

Botconf 2022 - Nantes, FR

Tactics

2011


2013

2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ Watchdog threads (2) § New RC4 Crypto scheme § Removes placeholders § Namecoins (.bit) § 63 Bytes checkin

BEACON

POST /

RC4 (
E1 07 46 32 38 32 31 38 45 36 46 41 32 45 30 42 45 35 39 42 46 42 45 44 44 37 37 36 35 42 35 30 46 34 37 43 42 41 45 38 43 45 00 73 61 6E 74 00 00 61 00 00 11 27 00 00 00 00 00 00 00 00 00
)

á.F28218E6FA2E0B E59BFBEDD7765B50 F47CBAE8CE.sant. .a...'.........

20

Botconf 2022 - Nantes, FR

Tactics

2011


2013

2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ 64 Bits § PROPagate

BEACON

POST /

RC4(
E2 07 30 31 36 32 33 44 31 43 44 35 44 36 44 37 36 33 34 31 34 34 43 32 37 36 38 39 46 32 30 35 39 37 37 43 42 41 45 38 43 45 00 00 00 00 00 00 00 61 00 00 11 27 00 00 00 00 01 00 00 00 00
)

â.01623D1CD5D6D7 634144C27689F205 977CBAE8CE...... .a...'.........

21

Botconf 2022 - Nantes, FR

Tactics

2011


2013

2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ Copy&Load ntdll.dll § Appends random Bytes § Cracked version

POST /

BEACON

RC4(
E3 07 32 44 43 43 32 43 35 30 32 46 45 32 45 45 45 34 33 34 42 41 38 32 42 37 38 34 43 34 45 36 39 46 37 43 42 41 45 38 43 45 00 31 31 30 36 00 00 61 00 00 11 27 00 00 00 00 01 00 00 00 6F 2D 66 6D 24 67 3D 3E 73 5D 6A 71 6B 21 5B 23 77 68 71 21 6C 29 24 77 36 60 39 6D 3E 44 3F 68 46 35 3F 68 5A 26 49 3E 49 67 5C 36 65 56 3C 70 52 56 48 3C 3F 68 23 4D 6B 4E 5D 47 5D 77 4E 4F 46 60 2E 59 31 43 40 73 4C 46 69 6F 6A 3F 78 77 6D 61 00
)

ã.2DCC2C502FE2EE E434BA82B784C4E6 9F7CBAE8CE.1106. .a...'........ofm$g=>s]jqk![#wh q!l)$w6`9m>D?hF5 ?hZ&I>Ig\6eV<pRV H<?h#MkN]G]wNOF` .Y1C@sLFioj?xwma .

22

Botconf 2022 - Nantes, FR

Tactics

2011


2013

2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ Checks keyboard(UA & RU) § Checks VM agents § Stops checking connection § Removes support to .bit

POST /

BEACON

RC4(
E4 07 33 44 36 43 34 42 30 42 46 36 45 30 42 38 31 31 33 39 37 46 34 41 34 30 38 44 33 32 39 37 43 36 37 43 42 41 45 38 43 45 00 54 45 53 54 2D 50 43 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 61 00 00 11 27 00 00 00 00 01 00 00 00 60 4C 21 4F 62 34 60 5F 4C 3A 76 74 25 7A 5E 72 50 2A 46 5D 3F 43 31 3D 6A 26 3E 51 5E 60 5D 50 36 60 4C 60 52 30 26 64 3E 4D 35 3C 2B 2A 6D 2A 75 41 7A 31 4B 4D 75 76 5A 47 24 63 36 65 64 58 4A 5C 4D 31 2E 54 31 5A 59 5C 64 73 50 46 4B 70 57 4F ...
)

ä.3D6C4B0BF6E0B8 11397F4A408D3297 C67CBAE8CE.TESTPC.............. .a...'........`L !Ob4`_L:vt%z^rP* F]?C1=j&>Q^`]P6` L`R0&d>M5<+*m*uA z1KMuvZG$c6edXJ\ M1.T1ZY\dsPFKpWO

23

Botconf 2022 - Nantes, FR

Tactics

2011


2013

2015

2017

2019

2021

2012

2014

2016

2018

2020

2022

§ No major releases

24

Botconf 2022 - Nantes, FR

Tactics

2011


2013

2015

2017

2012

2014

2016

2018

2019

2021

2020

2022

???

§ No major releases

25

Botconf 2022 - Nantes, FR

General Code Statistics
Complexity (AVG)
8 7 6 5 4 3 2 1 0
<2011 2011-12 2013 2014 2015 2017 2018 2019 2020

Basic Blocks (#)
300 250 200 150 100
50 0 <2011 2011-12 2013 2014 2015 2017 2018 2019 2020

Functions (#)

70 60 50 40 30 20 10
0 <2011 2011-12 2013

2014

2015

2017

2018

2019

2020

Imports (#)
140 120 100
80 60 40 20
0 <2011 2011-12 2013 2014 2015 2017 2018 2019 2020

26

Botconf 2022 - Nantes, FR

General Code Statistics
Complexity (AVG)
8 7 6 5 4 3 2 1 0
<2011 2011-12 2013 2014 2015 2017 2018 2019 2020

Basic Blocks (#)
300 250 200 150 100
50 0 <2011 2011-12 2013 2014 2015 2017 2018 2019 2020

Functions (#)

70 60 50 40 30 20 10
0 <2011 2011-12 2013

2014

2015

2017

2018

2019

2020

Imports (#)
140 120 100
80 60 40 20
0 <2011 2011-12 2013 2014 2015 2017 2018 2019 2020

27

Botconf 2022 - Nantes, FR

General Code Statistics
Complexity (AVG)
8 7 6 5 4 3 2 1 0
<2011 2011-12 2013 2014 2015 2017 2018 2019 2020

Basic Blocks (#)
300 250 200 150 100
50 0 <2011 2011-12 2013 2014 2015 2017 2018 2019 2020

Functions (#)

70 60 50 40 30 20 10
0 <2011 2011-12 2013

2014

2015

2017

2018

2019

2020

Imports (#)
140 120 100
80 60 40 20
0 <2011 2011-12 2013 2014 2015 2017 2018 2019 2020

28

Botconf 2022 - Nantes, FR

General Code Statistics
Complexity (AVG)
8 7 6 5 4 3 2 1 0
<2011 2011-12 2013 2014 2015 2017 2018 2019 2020

Basic Blocks (#)
300 250 200 150 100
50 0 <2011 2011-12 2013 2014 2015 2017 2018 2019 2020

Functions (#)

70 60 50 40 30 20 10
0 <2011 2011-12 2013

2014

2015

2017

2018

2019

2020

Imports (#)
140 120 100
80 60 40 20
0 <2011 2011-12 2013 2014 2015 2017 2018 2019 2020

29

Botconf 2022 - Nantes, FR

III. Data

30

Botconf 2022 - Nantes, FR

Infra-structure (2020)
§ 98 unique domains § 17 Countries

31

Botconf 2022 - Nantes, FR

Infra-structure (2017 - 2020)

2017

2018

2019

2020

32

Botconf 2022 - Nantes, FR

Payloads (2020)

§ 14.113 unique files § 4.312 configs § 18 families

2% 3% 4%

24%

isfb

qakbot

systembc dridex

raccoon

iceid

vidar

buer

silentnight trickbot

azorult

danabot

osiris

netwire

33%

photoloader amadey

nymaim

smokeloader

33

Botconf 2022 - Nantes, FR

34%

isfb

systembc

raccoon

silentnight

azorult

others

Payloads (2020)

§ 14.113 unique files § 4.312 configs § 18 families

2% 3% 4%

24%

isfb

qakbot

systembc dridex

raccoon

iceid

vidar

buer

silentnight trickbot

azorult

danabot

osiris

netwire

33%

photoloader amadey

nymaim

smokeloader

34

Botconf 2022 - Nantes, FR

34%

isfb

systembc

raccoon

silentnight

azorult

others

Payloads (2020)

EVENT COUNT (#)

1400

1200

1000

800

600

400

200

0

Ja n

Fe v

Mar

Apr

May

Jun

Jul

Aug

Se p

Oct

Nov

De c

35

Botconf 2022 - Nantes, FR

Payloads (2020)

EVENT COUNT (#)

1400

1200

1000

800

600

400

200

0

Ja n

Fe v

Mar

Apr

May

Jun

Jul

Aug

Se p

Oct

Nov

De c

nymaim amadey ph otol oader netwire osiris danabo tv3 trickbot bu er ic edid dridex qakbot azorult sil en tni gh t vidar smokeloader rac coon systembc isfb

36

Botconf 2022 - Nantes, FR

Payloads (2020) - ISFB

EVENT COUNT (#)

1400

1200

1000

800

600

400

200

0

Ja n

Fe v

Mar

Apr

May

Jun

Jul

Aug

Se p

Oct

Nov

De c

nymaim amadey ph otol oader netwire osiris danabo tv3 trickbot bu er ic edid dridex qakbot azorult sil en tni gh t vidar smokeloader rac coon systembc isfb

37

Botconf 2022 - Nantes, FR

Payloads (2020) - Silentnight

EVENT COUNT (#)

1400

1200

1000

800

600

400

200

0

Ja n

Fe v

Mar

Apr

May

Jun

Jul

Aug

Se p

Oct

Nov

De c

nymaim amadey ph otol oader netwire osiris danabo tv3 trickbot bu er ic edid dridex qakbot azorult sil en tni gh t vidar smokeloader rac coon systembc isfb

38

Botconf 2022 - Nantes, FR

Payloads (2020) - SystemBC

EVENT COUNT (#)

1400

1200

1000

800

600

400

200

0

Ja n

Fe v

Mar

Apr

May

Jun

Jul

Aug

Se p

Oct

Nov

De c

nymaim amadey ph otol oader netwire osiris danabo tv3 trickbot bu er ic edid dridex qakbot azorult sil en tni gh t vidar smokeloader rac coon systembc isfb

39

Botconf 2022 - Nantes, FR

Takeaways
§ Information about high-profile groups § Connections among families § Ransomware families § International presence

40

Botconf 2022 - Nantes, FR

Acknowledgements
§ TAC Team § TCR Team (@mandiant)

41

Botconf 2022 - Nantes, FR

Thanks
@marcos_alvares

42

Botconf 2022 - Nantes, FR

