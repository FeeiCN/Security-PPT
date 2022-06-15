
[ Hacker@KCon ]

9/6/2016 3:01:52 PM

0



----

Seeker



BD4ET

[ Hacker@KCon ]

9/6/2016 3:01:54 PM

1


·  ·  · LTE · GSM MITM ·  · 

9/6/2016 3:01:54 PM

2


·  ·  ·  · 

· 70772177

9/6/2016 3:02:42 PM

3

Part. 01


9/6/2016 3:01:54 PM

4

 | [ Hacker@KCon ]


·  
· WIFI3G/4G · 2G/3G/4G · WIFI2G · WIFI

9/6/2016 3:25:26 PM

5

 | [ Hacker@KCon ]
LTE
· WIFIWIFI 
· 2GLTE 2G/3G

9/6/2016 3:01:54 PM

6

 | [ Hacker@KCon ]

·  ·  · 

9/6/2016 3:01:54 PM

7

 | [ Hacker@KCon ]


1. 4GLTE 3G2G
2. 3GFemtoCell 
3. 2G CDMAFemtoCell 
4. 2G GSM  MITMRace Condition 

9/6/2016 3:01:54 PM

8

 | [ Hacker@KCon ]


TDMA

EDGE

GSM PDC cdmaOne

GPRS

WCDMA

CDMA2000 1x

CDMA2000 1x EV/DO

HSPA LTE

2G 9.6 - 14.4 kbps

evolved 2G 64­144 kbps

3G
384 kbps - 2 Mbps

evolved 3G 384 kbps - 100 Mbps

LTE-A
4G >1 Gbps

9/6/2016 3:01:55 PM

9

 | [ Hacker@KCon ]
LTE2G3G
LTELTE2G/3G LTE2G/3G
 LTE2G/3G  LTECSCS2G/3G
UELTE/2G/3GE-UTRA/GERAN/UTRA 2/4G3/4G



LTE



 
9/6/2016 3:01:54 PM



LTE3G

LTE2G



2G/3G

CS Fall Back

3G

2G
10

Part. 02
LTE

9/6/2016 3:01:54 PM

11

 | [ Hacker@KCon ]
LTE
1. LTE 2. LTE RRC 3. LTECell Reselection

9/6/2016 3:01:54 PM

12

 | [ Hacker@KCon ]
LTE
1. 
1) PC 2) BladeRFUSRP B2x0 3) LTE
2. 
1) Linux 2) OpenAirInterface 3) 

9/6/2016 3:01:54 PM

13

 | [ Hacker@KCon ]
LTE RRCredirectedCarrierInfo
1. redirectedCarrierInfo3G 
2. LTE CSFB 3. RRC
redirectedCarrierInfo RRC Connection Release 4. HackLTE

9/6/2016 3:01:54 PM

14

 | [ Hacker@KCon ]
LTE CSFB
LTE CSFB to 2G
 R8 RRC
2G

 2G 2G

 

 

CSFB 

LTERIM 2G3G

R9 RRC
2GID 

 2G 2G

 

RIM

eNodeB

RIM Signaling S1

MME

RIMLTE2G LTE 2G RIMLTE2G 9/6/2016 3:01:54 PM

E-UTRAN GERAN
BSS

Relaying RIM Signaling

S3/Gn

Gb/Iu

SGSN

RIM Signaling

15

 | [ Hacker@KCon ]
LTE CSFB

9/6/2016 3:01:54 PM

16

 | [ Hacker@KCon ]
LTE CSFBL3

9/6/2016 3:01:54 PM

17

 | [ Hacker@KCon ]
LTE CSFBL3

9/6/2016 3:01:54 PM

18

 | [ Hacker@KCon ]
LTE RRC

1. UECell ReselectionLTE 
2. UETAU RequestReject 3. UEAttach RequestReject 4. RRCConnectionRelease
redirectedCarrierInfo GSM 5.  RRCConnectionRelease

9/6/2016 3:01:54 PM

19

 | [ Hacker@KCon ]
LTE RRC
1. OAIR8R9RRCConnectionRelase 
2. MMEeNodeB

9/6/2016 3:01:54 PM

20

 | [ Hacker@KCon ]
LTE RRCL3

9/6/2016 3:01:54 PM

21

 | [ Hacker@KCon ]
LTE RRC

9/6/2016 3:01:54 PM

22

 | [ Hacker@KCon ]
LTECell Reselection

Cell A
9/6/2016 3:01:54 PM

Ranking

Freq.1 Priority : 5
Cell A
Cell B

Priority
Freq.2 Priority : 3
Cell C
Cell D

Freq.3 Priority : 1
Cell E
Cell F

CellRr4eseRle5ction

Cell B Cell C

R6

R7

OK! I see you
I am here!
Location RRe1g0istration
23

 | [ Hacker@KCon ]
LTECell Reselection
Intra Frequency & Inter Frequency with equal priority

Serving Cell

Neighbor Cell

Serving Cell

Inter Frequency and Inter-RAT

Neighbor Cell

Threshold : 3

Neighbor Cell

Priority : 5 RadioQuality : 4

Serving Cell

Priority : 3 RadioQuality : 5

Threshold : 2

Threshold : 2
Serving Cell
PrPiorriiotyrit:y5: 5 RaRdaiodQiouQauliatylit:y5: 1

Neighbor Cell
PrPiorriiotyrit:y3: 3 RaRdaiodQiouQauliatylit:y3: 1

9/6/2016 3:01:54 PM

24

Part. 03
GSM MITM

9/6/2016 3:01:54 PM

25

 | [ Hacker@KCon ]
GSM MITM
1. GSM MITM 2. GSM  3. GSM MITM 4. GSM MITM

9/6/2016 3:01:54 PM

26

 | [ Hacker@KCon ]
GSM MITM

1. 
1) PC 2) USRP B200mini 3) Motorola C118CP2102 4) Nokia
2. 
1) Linux
2) OpenBSC
3) OsmocomBB

9/6/2016 3:01:54 PM

27

 | [ Hacker@KCon ]
GSM MITM
1. 
1) PC 2) Motorola C118CP2102 3) Nokia
2. 
1) Linux 2) OpenBSC 3) OsmocomBB

9/6/2016 3:01:54 PM

28

 | [ Hacker@KCon ]
GSM1
·  · MSCampingSIM
 
· Location UpdateLocation UpdateMS
·  LACLocation Area Code Cell Reselection

9/6/2016 3:01:54 PM

29

 | [ Hacker@KCon ]
GSM2
· MSLocation UpdateIdentity RequestMS MSIMSIStingrayIMSI Catcher Identity RequestMSIMEIIMSIIMEI   IMSIIMSI
· IMSI MSRejectMS Location Updating RequestMS Location Updating Request LACT32121

9/6/2016 3:01:54 PM

30

 | [ Hacker@KCon ]
Location Update
· MSIdle  Cell Reselection  LALocation Area Location Update

9/6/2016 3:01:54 PM

31

 | [ Hacker@KCon ]
Location Update1

1. MSLocation Updating Request TMSILAILocation Area Identity

2. MSIMSIHLRIMSI Identity RequestMS MSIMSITMSIIMSI LAIMSCIMSI HLR

3. Location UpdateAuthentication MSAuthentication Request RANDMSC/HLRKi SRESSRESA3RAND,Ki

9/6/2016 3:01:54 PM

32

 | [ Hacker@KCon ]
Location Update2
4. MSRANDSIMSIMKi RANDA3SRES
5. MSSRESAuthentication Response 6. SRES 7. Location Updating AcceptedMS
TMSI 8. MSTMSI Reallocation Complete 9. Location Update

9/6/2016 3:01:54 PM

33

 | [ Hacker@KCon ]
GSM Location Update L3 

9/6/2016 3:01:54 PM

34

 | [ Hacker@KCon ]
Mobile Terminated Services
·  Mobile Terminated Services

9/6/2016 3:01:54 PM

35

 | [ Hacker@KCon ]
Mobile Terminated SMS1
1. HLRMSMSCMSCTMSI 2. MSLocation AreaTMSIPaging
Request 3. MSPCHTMSIRACHChannel Request
 4. AGCHImmediate
Assignment 5. MSPaging Response 6. Authentication Request
Location Update3-6

9/6/2016 3:01:54 PM

36

 | [ Hacker@KCon ]
Mobile Terminated SMS2

7. SABMMSRASetup 8. CP-DATAMSCP-
ACK 9. Channel ReleaseMS
Disconnect 10. 11.140
140

9/6/2016 3:01:54 PM

37

 | [ Hacker@KCon ]
GSM MITM
·       

9/6/2016 3:01:54 PM

38

 | [ Hacker@KCon ]
GSM MITM

1. MSISDN 2. HLR LookupIMSI 3. Paging/HLR Lookup/Cell ID 4. 50m300m 5. RejectIMSI

6. 
7.  

9/6/2016 3:01:54 PM

39

 | [ Hacker@KCon ]
GSM
· 
­ Motorola C118C139 x1 ­ CP2102 USB x1 ­ 2.5mm  x1 ­ 18
· OpenBSC · Nokia 1110/3110  Net Monitor · Ubuntu 12.0414.04

9/6/2016 3:01:54 PM

40

 | [ Hacker@KCon ]
GSM
· 
­ Motorola C118C139 x1 ­ CP2102 USB x1 ­ 2.5mm  x1 ­ 18
· OsmocomBB

9/6/2016 3:01:54 PM

41

 | [ Hacker@KCon ]
GSM MITMOpenBSC

1. 
2. IMSIMITM
3.  
4.  

9/6/2016 3:01:54 PM

42

 | [ Hacker@KCon ]
GSM MITMOsmocomBB

1. OpenBSCIMSI 2. IMSILocation
Update 3. 
OpenBSC 4. OpenBSC

5.  3-4

9/6/2016 3:01:54 PM

43

 | [ Hacker@KCon ]
GSM MITMOsmocomBB

9/6/2016 3:01:54 PM

44

 | [ Hacker@KCon ]
GSM MITMOpenBSC

9/6/2016 3:01:54 PM

45

 | [ Hacker@KCon ]
GSM MITM&

9/6/2016 3:01:54 PM

46

 | [ Hacker@KCon ]

Demo

9/6/2016 3:01:54 PM

47

Part. 04


9/6/2016 3:01:54 PM

48

 | [ Hacker@KCon ]


1. LTE+ 
2.  10-20
3. 
4. 

9/6/2016 3:20:04 PM

49

 | [ Hacker@KCon ]


1. QQ 
2.   
3.  4. You name it

9/6/2016 3:01:54 PM

50

Part. 05


9/6/2016 3:01:54 PM

51

 | [ Hacker@KCon ]

1.  2. 


9/6/2016 3:01:55 PM

52

 | [ Hacker@KCon ]


9/6/2016 3:01:55 PM

53

THANKS
[ Hacker@KCon ]

9/6/2016 3:01:54 PM

54

