VXWORKS FUZZING 
VXWORKS 

KCon West 2016



 (404)

TDG

(404)

KCon West 2016



 (404)

TDG

(404)

KCon West 2016


     FuzzWDB  Fuzz  Vxworks   VxWorks WDB RPC  

KCon West 2016

-

  



 




 





KCon West 2016

-





""   

  

 

FUZZING

  







 
N
?
Y

KCon West 2016


 
SULLEY

FUZZ 

1

  VXWORKS
N
KCon West 2016



SULLEY

FUZZ  VXWORKS

SULLEY 

Ø http://www.freebuf.com/news/93201.html

Ø Python 9 Sulley

Ø 

KCon West 2016



FUZZ 

SULLEY

VXWORKS

VXWORKS

WindRiver,198315

CPU

x86MIPS PowerPCSPARCSH-4ARMStrongARMxScale CPU


1) 
2) 787
3)  KCon West 2016
VxWorks


FUZZ 

SULLEY

VXWORKS

VXWORKS 



ü VxWorks 5.5 

ü VxWorks 6.6  ü VmWareVxWorks(5.5)

2011 | frank

https://github.com/knownsec/VxPwn VxWorks KCon West 2016



FUZZ 

VXWORKS

Fuzzing
ü  ü 

1
ü  ü 

N
ü  ü 
KCon West 2016


2015-9 44CON

Yannick FormaggioVxWorks FuzzingSulleyVxWorks FuzzingVxWorksWDB RPC ()
KCon West 2016



FUZZ 



WDB

1

VXWORKS

N

Fuzzing
ü  ü 

ü  ü 

ü 

ü 

KCon West 2016

WDB RPC 
Ø  Ø SUN-RPC Ø UDP17185 Ø WDB RPCVxWoks TAgent Ø  V1V2

ü  ü 
KCon West 2016

VXWORKS 
Shell

Debugger

Other Tools

TServer

WDB RPC

WDB Serial

Non-WDB Back End

Network Comm if

Serial Comm if

TAgent Target OS

Non-WDB Agent

KCon West 2016

FUZZ
Shell

Debugger

Other Tools

FUZZ

VxMon

TServer

WDB RPC

WDB Serial

Non-WDB Back End

Network Comm if

Serial Comm if

TAgent Target OS

Non-WDB Agent

VxMon  DebuggerTAgent VxMonTAgent 

KCon West 2016

FUZZ

VxMon WDB RPC

Fuzz

Network Comm if
TAgent
Target OS

KCon West 2016

FUZZ

VxMon

Fuzz

WDB RPC

TAgent Target OS

KCon West 2016

WDB PRC 

* IP Header

* UDP Header

* RPC Request Header

* WDB Parameter Wrapper

* Function input parameters

WDB Parameter Wrapper

Function input parameters 



KCon West 2016

WDB PRC 

* IP Header * UDP Header * RPC Reply Header * WDB Reply Wrapper * Function output
WDB Parameter Wrapper  Function output
KCon West 2016

VxMon  Vxworks 
V2WDB RPCV1VxWorksBSP WDB_TGT_INFO_GETV1V2Session WDB_TARGET_CONNECTTAgent SessionSUN RPC -> Transaction IDWDB RPC -> sequence
KCon West 2016

-

VxMon

Fuzz

WDB RPC

TAgent Target OS

KCon West 2016

-

KCon West 2016

-

KCon West 2016

-

KCon West 2016

-
Vxworks a)  b)  c)  d)  e) 

KCon West 2016



KCon West 2016


 a)  b) WDB_EVENT_GET

KCon West 2016

-

KCon West 2016

-

KCon West 2016



KCon West 2016

...
 
VxMonWDB_REGS_GET 
VxMonWDB_MEM_READ 

wdbdbg.py

KCon West 2016

FUZZ

VxMon

Fuzz

WDB RPC

TAgent Target OS

KCon West 2016

FTP (TCP/21) FUZZING
FTPfuzz
KCon West 2016

FTP (TCP/21) FUZZING
FTP fuzz * 6.6 * 5.5FTPring buffer overflowVxWorks FTP
KCon West 2016



KCon West 2016

SUNRPC RPCBIND FUZZING

KCon West 2016

SUNRPC RPCBIND FUZZING
Fuzzing: 5.56.618Payload Github tPortmapd
KCon West 2016

RPCBIND 
rpcbindSUN-RPCVxWorks tcp/111udp/111  rpcbind  

KCon West 2016

VXWORKS 6.6-

KCon West 2016

VXWORKS 5.5-

KCon West 2016

VXWORKS 5.5-

KCon West 2016

VXWORKS 5.5-

KCon West 2016

VXWORKS 5.5-

KCon West 2016

VXWORKS 5.5-

KCon West 2016

VXWORKS WDB RPC V2!!!

WDB RPCVxWorks17185 

* 

* --

* VxWorks

* 

* 

* ...

KCon West 2016

VXWORKS WDB RPC V2!!!
Kimon VxWorks---- WDB RPC Kimonz-0ne 2015-11 WDB RPC34000
KCon West 2016

VXWORKS WDB RPC V2!!!

9000 8000 7000 6000 5000 4000 3000 2000 1000
0

0 

7861 

5283 

TOP10 (V1)

3056

1025

823







647

505

486

481

448



  


KCon West 2016

VXWORKS WDB RPC V2!!!

18000 16000

15601

14000

12000

10000

8000

6000

4000

2000

0 VxWorks 5.5.1

6583 VxWorks 5.4.2

    ( V 1)

5410

5254

VxWorks 5.4

899

VxWorks 5.4.2

VxWorks 5.5

654 VxWorks

236
VxWorks 5.3K.1Con West 2016

VXWORKS WDB RPC V2!!!
PLC a) Rockwell Automation 1756-ENBT3.2.63.6.1 b) Siemens CP 1604Siemens CP 1616 c) Schneider Electric 
KCon West 2016

VXWORKS WDB RPC V2!!!

ZoomEyeIPv452586Vxworks

40000 35000 30000 25000 20000 15000 10000
5000 0

34000 WDBRPC V1(Vxworks 5.x) z-One

30339 WDBRPC V1(Vxworks 5.x)

2155 WDBRPC V2(Vxworks 6.x)

20093
Vxworks ?? KCon West 2016

VXWORKS WDB RPC V2!!!

800

700

667

V2--ZoomEye

600

500

400

300

266 228

200

156

128

100

73

60

60

59

57

7

0























KCon West 2016

VXWORKS WDB RPC V2!!!

2000 1800 1600 1400 1200 1000 800 600 400 200
0

1878 Vxworks 6.6

V2--ZoomEye

8 Vxworks 6.7

250 Vxworks 6.8

20 Vxworks 6.9

KCon West 2016

/ 

WDB RPC V2  KimonWDB RPC V1 
KCon West 2016


FuzzingSulleyVxWorks 5.56.6FTPSun-RPC rpcbind FuzzingVxWorks 6.6FuzzingWDB RPC V2WDB RPC V2 WDB RPCVxWorks VxWorks
KCon West 2016

Thanks...

KCon West 2016

