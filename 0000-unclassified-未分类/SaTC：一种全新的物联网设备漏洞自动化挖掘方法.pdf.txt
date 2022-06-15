SaTC: 
 


· Gartner202058* · ...
* https://www.gartner.com/en/newsroom/press-releases/2019-08-29-gartner-says-5-8-billion-enterprise-and-automotive-io


· 57%IoT* · IoT ·  · 
* https://iotbusinessnews.com/download/white-papers/UNIT42-IoT-Threat-Report.pdf


·  · WebDNSUPnP · 

?

Target programs

Run



Dynamic Analysis
Static Analysis

·  · Fuzzing · 
· 

·  FIRMADYNENDSS 2016

Target programs

Run



Dynamic Analysis
Static Analysis

·  · Symbolic Execution ·  
· 

·  KARONTE S&P 2020

--SaTC
·  ·   (    )  




Malicious Request: http://IP:Port/goform/setUsbUnload?deviceName=evalCMD

Intuition
JS

JS "deviceName="

 "deviceName"



Intuition verification

10 92.4%  keyword-value 

Vendor Tenda Tenda Tenda Tenda Netgear Netgear Motorola D-Link D-Link TOTOLink Average

Device Series #Front-Str #Back-allStrs #Intersect Verified

AC9

101

49,288

86

70

AC15

81

241,314

65

63

AC18

81

119,537

66

57

W20E

161

139,885

89

79

R7000P

114

467,706

59

59

XR300

135

517,254

76

72

M2

133

83,911

31

31

867

85

84,764

53

50

882

100

522,317

86

81

A950RG

69

53,931

31

27

-

106

227,990

64

59

%

81.4 · 

96.9

· 

86.4

88.8

100

94.7 CVE54

100 35
94.3
94.1 29

87.1 ""
92.4


     


· SaTC 






· HTML · 
· idname · JavaScript
· AST
· AST Literal  · XML
· 
· XML

HTTP  HTTP  UPnP, HNAP




·  ·  !@$ ...
·  "=" 
· 3
· JavaScript  ·  ...

 

·  ·  Button, Cancel...


·  ·     · GNU strings 
·  · 
· 




1deviceName


2usbName 


3url_filter_mode NVRAM




·  ·  · cmd 


·  ·  · 
· Sink Point · Memcpy-like  · System-like 
·  · Sink Call Trace:  · Call Trace Merging: Call Trace
Start

FuncE FuncF

FuncA

FuncB

SinkX

FuncC

SinkY

Call Tree


·  ·  ·  ·  ·  · 


·  ·  ·  · BBL

SaTC
· Q1SaTC · Q2SaTC · Q3



Vendor Type

Series

· Dataset
# SizeP SizeUP Arch

Netgear Router R/XR/WNR 19

Tenda Router AC/G/W

9

38M 12M

192M ARM32 105M ARM32

· 6 14

TOTOLink Router

A/T

2

5M

60M ARM32

· 

D-Link Router DIR/DSR

5

8M 123M MIPS32

Motorola Router Axis Camera

C1/M2 P/Q

2

12M

64M MIPS32

2

60M 700M ARM32

· 39   · ARMMIPS

Q1Real world 

Vendo
Netgear

Device Series
R7000/R7000P R6400v2 XR300
W20E

Tenda

G1/G3

TOTOLink

AC15/AC18
T10 A950RG

DIR 823G

D-Link

DIR 878

Motorola Total

DIR 878 882 C1 M2

Type
BoF CI CI CI IAC CI
CI CI CI
IAC
CI
IAC CI CI 3

Bug IDs
PSV-2020-0267 CVE-2020-28373 CNVD-2020-15102 CNVD-2020-28091 PSV-2020-0277 CNVD-2019-22866 CNVD-2019-22867 CNVD-2019-22869 1 unassigned CNVD-2020-46058 CNVD-2020-46059 CNVD-2020-29725 CNVD-2020-40766 CNVD-2020-40767 CNVD-2020-40768 CNVD-2020-28089 CNVD-2020-28090 1 unassigned CVE-2019-7388 CVE-2019-7389 CVE-2019-7390 CVE-2019-8392 CVE-2019-8312 CVE-2019-8314 CVE-2019-8316 CVE-2019-8317 CVE-2019-8318 CVE-2019-8319 1 unassigned CNVD-2020-23845 CVE-2019-9117 CVE-2019-9118 CVE-2019-9119 33

Ksrc
HTML XML HTML+ HTML+ HTML JS JS HTML JS JS JS JS JS JS JS JS JS JS JS JS JS JS XML XML XML XML XML XML JS XML JS JS JS 3

Service
HTTP UPnP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HTTP HNAP HNAP HNAP HNAP HNAP HNAP HTTP HNAP HTTP HTTP HTTP 3

· Vulnerability · 33  ·  30  CVE/CNVD/PSV
· Services
· HTTP · Home Network Administration Protocol (HNAP) · Universal Plug and Play (UPnP)

Q2

Vendor Series Input

Tenda AC15

119

Tenda AC18

119

Tenda W20E

134

Tenda G1

147

Tenda G3

147

Netgear XR300

864

Netgear R6400

489

Netgear R7000

610

Netgear R7000P

607

D-Link 878

251

D-Link 882

252

D-Link 823G

110

TOTOLink T10

59

TOTOLink A950RG

73

Motorola C1

105

Motorola M2

103

Keyword Extraction

str fKey time(s)

7,771

995

254

7,663

984

145

10,581 1,744

102

14,241

137 1,952

14,241

137 1,952

18,889 4,232

683

5,692 1,729

32

9,421 2,304

167

8,670 2,257

67

26,389 3,415

492

25,608 3,025 1,149

10,200 2,544

370

6,217

869

231

7,520 1,267

303

12,347 2,133

315

10,982 1,863

303

Border Binary Recognition

Verification

strAll borderBin borderKey time(s) vPar/tPar % vAct/tAct

241,314

httpd

447

51 223/319 69.91 101/128

119,537

httpd

447

57 222/319 69.59 101/128

139,885

httpd

834

102 423/589 71.82 222/245

123,960

httpd

636

75 422/586 72.01

5/56

123,960

httpd

636

75 422/586 72.01

5/56

517,254

httpd

1,226 1,280 330/1,014 32.54

11/211

478,005

httpd

887

449 288/706 40.79

10/180

330,087

httpd

1,132

452 456/920 49.57

0/211

467,706

httpd

1,121

579 455/919 49.51

0/201

139,948 prog.cgi

735

170 223/735 45.44 140/520

522,317 prog.cgi

878

670 256/416 61.54

91/461

48,005 goahead

255

78 27/167 16.17

24/87

51,898 system.so

64

24

35/41 85.37

20/23

53,931 system.so

180

31

53/66 80.3

35/114

90,652 prog.cgi

370

89 44/147 29.93 175/223

83,911 prog.cgi

333

93 38/137 27.74 143/196

%
78.91 78.91 90.61
8.39 8.39 5.21 5.56
0 0 26.92 19.74 27.59 86.96 30.7 78.48 72.96

· 33 22JavaScript8XML4HTML

Q3
· 

Q3

Vendor Series
Tenda AC18 Tenda AC15 Tenda W20E Tenda G1 Tenda G3 Netgear WNR3500 Netgear XR300 Netgear R6400 Netgear R7000P Netgear R8000 Netgear R8500 D-Link 878 D-Link 823G TOTOLink T10 TOTOLink AR950

Command Injection

#Sensitive #Merged

207

113

202

110

93

48

45

36

45

36

69

22

14,728

718

31,605

605

62,840

858

19,588

718

23,537

528

17,153

246

6,811

121

62

21

95

28

% 54.59 54.46 51.61
80 80 31.88 4.88 1.91 1.37 3.67 2.24 1.43 1.78 33.87 29.47

Memory Corruption

#Sensitive #Merged

38917

1,634

38923

1,638

955,123

1,287

794,104

1,082

794,104

1,082

1,635

164

24,079

1,363

41,120

1,109

143,455

2,192

38,929

1,616

35,740

893

64,075

1,545

257,410

313

1

1

18

16

% 4.2 4.21 0.13 0.14 0.14 10.03 5.66 2.7 1.53 4.15 2.5 2.41 0.12 100 88.89

Sum %
4.47 4.47 0.14 0.14 0.14 10.92 5.36 2.36 1.48 3.99
2.4 2.2 0.12 34.92 38.93

· D-LinkNetgearcall trace

Q3

·  · SaTC  101 46 · atoi()
·  · 7 · 4082 SaTC · Tenda AC18 · cmdinput · datamain.js


· 
· ""
· SaTC · Paper and Slides
· https://www.usenix.org/conference/usenixsecurity21/presentation/chen-libo
· Code and Dataset: · https://github.com/NSSL-SJTU/SaTC

Thanks Q & A

