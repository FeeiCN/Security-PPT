What  You  Always  Wanted  and  Now  Can:   Hacking  Chemical  Processes  
Marina  Krotofil,  Jason  Larsen  
European  Network  for  Cyber  Security   IOAc@ve  
  
HITB,  Amsterdam,  Netherlands  
29.05.15  

ENCS

          Who  we  are  

(Ex)Academic  

Hacker  

q Countless  Skypes  and  twice  as  that  emails   q 5  joint  publica8ons   q S8ll  finding  each  other  awesome  :--P  

What  is  this  talk  about  
ENCS  

          Industrial  Control  Systems  

Physical   applica@on  

          Cyber--physical  security  
qCyber--physical  systems  are  IT  systems  "embedded"   in  an  applica@on  in  the  physical  world    
q AYacker's  goals:  
o Get  the  system  in  a  state   desired  by  the  a@acker  
o Make  the  system  perform   ac8ons  desired  by  the  a@acker  
  

          Smart  instrumenta@on  
   q Converts  analog  signal  into  digital  form   q Pre--process  the  measurements   q IP--enabled  (part  of  the  "Internet--of--Things")  

Old  genera@on   temperature  sensor  

Sensor  

Computa@onal   element  

          Here's  a  plant.  Go  hack  it.  

          Tradi@onal  security  

TLS  

Alice  

Bob  

In  tradi8onal  security  TLS  is  the  savior  of  all  things  

  Encryp@on  and  safety  

Help  Me!  

Crypto  Key  Invalid:   Access  Denied!!!!  

qMost  of  the  8me  no  one  cares  if  you  can  read  the  data   qWhen  the  electronics  stop,  the  physical  process  con8nues   qRejec8ng  a  message  is  oNen  not  the  "safe"  thing  to  do  

          Physics  don't  stop  and  reboot  
INERTIA  
Your  truck  has  breaks...     The  massive  hunk  of  stone  doesn't  

          Key  Take  Aways  

1   Industrial  systems  can  be  controlled  without   modifying  the  contents  of  the  messages  

o This  can  be  effec8ve  even  if  the  traffic  is  signed  

or  even  encrypted  

  

  

2  

Process  data  can  be  spoofed  to  make  it  look  like   everything  is  normal  to  mere  humans  

o This  can  be  done  despite  all  tradi8onal  

communica8on  security  put  in  place  

  

  

SCADA  101  

ENCS  

          Automa@on  
(Nest  because  it's  so  cute!)  
Set  point   Running  upstairs  to  turn  on  your   furnace  every  8me  it  gets  cold   gets  8ring  aNer  a  while  so  you   automate  it  with  a  thermostat.  

          Control  loop  

kg/h %

Physical  process  

Sensors  

Measure  process   state  

3750

D Feed

3700

3650

  

  
3600
  

35500

   10 20 30 40 50 60 70 80 Hours

Control   system  
Computes  control   commands  for   actuators  

Actuators  

Adjust  themselves   to  influence  
process  behavior  

63.8 63.6 63.4 63.2
63 62.8 62.6 62.40

D feed 10 20 30 40 50 60 70 80

          Control  logic  
q Obviously  control  logic  gets  more  complex  than  your   thermostat  
q You'll  need  something  bigger  than  a  thermostat  to  handle  it  all   q Most  of  the  8me  this  is  a  programmable  logic  controller  (PLC)   q It  is  programmed  graphically  most  of  the  8me  

          Control  logic  
Computer  scien8sts:    Noooooooo!!!!    Just  give  me  a  real  language!  

          PLC  internals  

Sensors  

1. Copy  data  from  inputs  to  temporary  storage  

2. Run  logic  

Actuators  

3. Copy  from  temporary  storage  to  outputs  

Outputs   Inputs  

          Analog  communica@on  

o 4--20  mA   o 0--10  v   o Air  pressure  
Usually  values   are  scaled  into   meaningful  data   in  the  PLC  

Wires  are  run  from  sensors  and   actuators  into  wiring  cabinets  

          Fieldbus  based  communica@ons  

Founda8on  Fieldbus  

Hart  

Profibus  

You  too  can  pay  $60  per   meter  for  really  bad  cable  

Custom  network  cables.    Custom  protocols.    No  TCP/IP  here.  

          TCP/IP  based    communica@on  
Industrial  switch  
Ethernet  my  old  friend   (Hack  meeeeee!!!)  
Modbus,  DNP,  IEC850  are  common  protocols    

Part  1   Process  manipula@on  
ENCS  

          Stale  Data  problem  

          Stale  Data  aYack  

Sensors  

Physical  process  

43  

55  

90  
PLC  

61  

13  

43  

10  

49  

AYack  @me  
Actuators  

43    45    47    45    43    43    44    43    43  

  

9.5

90    89    88    91    91    90    89    90    91    

9.4

  

9.3

13    15    17    15    13    13    14    13    13    

9.2

  
10    17    10    12       10    10    10    10    10    

9.1
Stale  data   9

    

  

8.90

1000 2000 3000 4000 5000 6000 7000

A     Yack  @m    e   AYack  dura@on  

          Stale  Data  aYack  

Sensors  

AYack  @me  
Physical  process  

15  

Actuators  
43  

23  
PLC  

90  

61  

13  

12  

60  

Saturated   output  

43    45    47    45    43    43    44    43    43  
  
90    89    88    91    91    90    89    90    91    
  
13    15    17    15    13    13    14    13    13    
  
60    59    62    60    70    75    80    95    99    

Saturated  output  

AYack  @me   AYack  dura@on  

          DoS  aYacks  on  cyber--physical  systems    
q What  to  DoS:  sensor  or  actuator?      

          Stale  Data  problem  
qProcess  data  doesn't  show  up  every  8me  around  the   logic  
o External  racks  may  only  report  in  every  few  cycles   o TCP/IP  protocols  are  ohen  report--by--excep@on  
qThe  input  memory  contains  the  last  known  good  value  

          Case  study  
qVendors  please  don't  hate  me  again  L    
o I  kept  your  name  secret  
qThis  is  actually  a  pre@y  typical  example   qThis  vendor  used  the  same  style  logic  for  all  external  
data  
Redacted  
   (And  not  really  this  vendor  if  you  steal  our  slides)  

          Case  study  

Logic  

Vendor   Internal  

Modbus   IEC  
Vendor  

Ethernet   Serial  

Backplane  
Vendor  Protocol  Handshake  --    Session  4000   Vendor  Protocol  Handshake  --    Session  5000   Vendor  Protocol  Handshake  --    Session  6000   IEC  Protocol  Handshake   Vendor  Protocol  Handshake  --    Session  8000   Vendor  Protocol  Handshake  --    Session  9000     

          Case  study  
Length   Session  ID   Sequence  Number  
Number  of  Samples   Sample  Value  

          Case  study  
The  result   qYou  can  freeze  all  points  for  a  par8cular  session  with  a  
UDP  packet  by  advancing  the  sequence  number   qYou  can  keep  session  alive  and  by  sending  a  UDP  
packet  every  30  seconds  to  any  interface  

          DoS  by  Eireann  LevereY  &  MaY  Erasmus  
qEireann  Levere@  &  Ma@  Erasmus  showed  bugs  in   industrial  switches  
o With  access  to  the  switch  only  ACK  messages  could  be   passed  
o The  link  would  show  up  as  healthy   o No  data  would  be  updated  

All  mighty  DoS  aYacks  
ENCS  

          Plants  for  sale  
From  LinkedIn  

          Tennessee  Eastman  (TE)  chemical  process  

          Timing  of  the  DoS  aYack  

Ordinary   glitch  

kPa gauge

2820 2810 2800 2790 2780 2770 27600

Reactor Pressure
Without attack Under attack 10 20 30 40 50 60 70 Hours

2950

2900

Near  miss  

kPa gauge

2850
(almost  

safety  

2800

Reactor Pressure

Without attack Under attack

accident)   2750

27000

10 20 30 40 50 60 70 Hours

kPa gauge

kPa gauge

2850 2800 2750 2700 2650 2600 2550 2500 24500

Reactor Pressure
Without attack Under attack 10 20 30 40 50 60 70 Hours

Economic   inefficiency  

3000 2950

Reactor Pressure
Without attack Under attack

2900

2850

2800

27500

5

10

15

20

25

30

Hours

Safety   shutdown  

Impact  of  8h  long  DoS  a@acks  on  reactor   pressure  sensor  at  random  8me  

          Time  to  aYack?  
1     Derive  a  model  a  of  the  plant's  dynamic  behavior  
o We  have  some  ideas  ­  ongoing  research  

          Time  to  aYack?  

kPa gauge

2     Educated  guess  

o   Response  of  the  process  depends  on  the  value  of  DoS  value    

2820 2810 2800 2790 2780 2770 27600

Reactor Pressure
2820
Without attack Under attack
2810 10 20 30 40 50 60 70 Hours

Sensor signal
To  decrease  process  value  

kPa gauge

2850 2800 2750 2700 2650 2600 2550 2500 24500

Reactor Pressure
Without attack Under attack 10 20 30 40 50 60 70 Hours

kPa gauge

2800 2790

Set  pointç  
3000 2950

Reactor Pressure
Without attack Under attack

kPa gauge

2950

Reactor Pressure

Without attack

To  increase  process  value   2900

2900

2780 Under attack

2850

2850

0

10

20

30

40

50

60

70

2800

Hours

2800

2750 27000

10 20 30 40 50 60 70 Hours

27500

5

10

15

20

25

30

Hours

kPa gauge

          Quest  for  the  peak  

2.820
Peak Peak
2.810

Sensor signal
Peak BBeesstt  ppeeaakk   No  more  good  peaks  L  
Peak

kPa gauge

2.800

2.790

2.780 0

10

20

30

40

50

60

70

Hours

q REAL  TIME  decision  making  problem   q Searching  for  the  "BEST"  peak     q Achieving  results  within  some  8me  horizon    

          Avocado  problem    

          Best  Choice  Problems    
q Problem  of  choosing  the  8me  to  take  a  par8cular  ac8on     o Based  on  sequen8ally  observed  random  variables     o In  order  to  maximize  an  expected  pay  off    
q Applied  in  a  wide  range  of  applica8ons  including  financial   o Best  8me  to  buy  or  sell  stocks   Secretary  Problem  

          Secretary  Problem:  sensor  signal  

kPa gauge
kscmh

2.820 2.810

n/e
Observed max
(aspira8on   value)  

Sensor signal Overall max

n  ­  number  of  hours  (e.g.  24  h)  

n

ObsWin

AtkWin

Attack value

2.800

2.790

A feed

0.5 AYack  value   Peak  

0.4

·  

2.780 0

10

20

30

400.3

50

60

70

Hours

0.2

Observa@on  

AYack  window0.1  

window  

0

10

20

30

40

Number  of  candidates:  #  sensor  signal  saHmoursples  in  24  hours  

          We  are  not  successful  yet  

Sensor  

A--feed  

min  

max  

E--feed  

min  

max  

Recycle  flow   min  

max  

Reactor  

min  

pressure  

max  

Reactor  level   min  

max  

Reactor  

min  

temperature   max  

Safety  @me,  h  
22.22  
4.29   2.83   4.39   9.17   8.56  
2.37   2.73   1.34   0.65  

q Process  dynamic  is  highly   non--linear  (???)  

          Accelerate  it:  chaining  aYacks  

% m3/h

q Chain  DoS  aYacks:  on  sensors  

25.8 25.6

Product Sep Underflow

q Use  change  detec8on   algorithms  (e.g.  CUSUM)  to   detect  state  change  

25.4

25.2

25 Candidate  for  

24.8 chaining  aYack  

24.60

5

10

15

20

25

30

Hours

Product Sep Level 100

80

60

40

·  
20 AYack  here  

00

2

4

6

8

10

12

14

16

Hours

q Chain  two  DoS  aYacks:  on   sensor  and  actuator  
q Safety  8me  3.43  h  vs.  12.03   h  in  case  of  direct  a@ack  

Part  2   AYack  concealment  
ENCS  

          Spoof  scenarios  
q,,Record--and--play--back"  
o Used  in  Stuxnet  ;--)   o Storage  requirements  
qDerive  process  model  
o Requires  knowledge,  CPU  cycles   and  storage    
qCraNed  sensor  signals    
o Reconstruc8on  of  sensor  data   features  

          Process  data  

kg/h kPa gauge

Process  data  originates  in  the  physical  world  

3750

Reactor pressure 2820

2810

2800

2790

2780

0

10

20

30

40

50

60

72

Hours

D feed

3700

3650

3600

0

10

20

30

40

50

60

72

Hours

kscmh

A and C feed 9.8

9.6

9.4

9.2

9

8.8

8.6

0

10

20

30

40

50

60

72

Hours

          Data  veracity  
qSo  what  if  sensor  readings  are  manipulated  at  source,   BEFORE  they  are  handed  to  the  IT  infrastructure?  
o And  wrong  data  securely  transferred  to  the  final   des8na8on  (authen8cated  and  integrity  protected)...  
  
Veracity:  data  security  property   that  a  statement  about  an  aspect   relevant  in  a  given  applica8on   truthfully  reflects  reality  
As  you  always  knew  it:  NEVER  TRUST  YOUR  INPUTS!!  

          Data  veracity  viola@on  
1     Manipula8on  of  the  physical  process   qEquipment  connected  to  each  to  each  
other  over  digital  communica8on  and   physics  of  the  process  
qComponents  can  influence   each  other  even  if  their   control  loops  do  not   communicate  electronically  

          Data  veracity  viola@on  
2     Sensor  miscalibra8on  
Safety  Instrumented  Systems  

Interna@onal  society  of   Automa@on  
InTech,  ISA  magazine     April  2014  
HIMA  presenta@on,   October  2014  

          Data  veracity  viola@on  
3     Data  spoofing  on  microcontroller  
  
qJason  Larsen's  presenta8on  at  Black  Hat'14   qHiding  en8re  a@ack  in  a  pressure  meter  
o Kilobytes  of  memory  (total)   o Very  li@le  CPU  power   o Kilobytes  of  flash  (total)     

          Black  Hat  

Think  of  the  process   data  as  a  set  of  
triangles.  Triangles  are   cheap  and  easy  

          Last  year...  
           

          Some  @me  aher  Black  Hat  

          Some  @me  aher  Black  Hat  

          Some  @me  aher  Black  Hat  

          2  evil  algorithms  

          All  sensor  signals  are  not  the  same  

kscmh

A feed
0.5

0.4

0.3

0.2

0.1

0

10

20

30

40

50

60

72

Hours

A and C feed
9.8

9.6

9.4

9.2

9

8.8

8.6

0

10

20

30

40

50

60

72

Hours

kg/h

kPa gauge

Reactor pressure
2820

2810

2800

2790

2780

0

10

20

30

40

50

60

72

Hours

3750

D feed

3700

3650

3600

0

10

20

30

40

50

60

72

Hours

kscmh

          Sensor  noise  

qRuns  analysis:  treats  noise  as  pseudo--random   sequence    

9.5

9.5

9.4

9.4

9.3

9.3

9.2

9.2

9.1

9.1

9

9

8.90

1000

2000

3000

4000

5000

6000

7000 8.90

1000 2000 3000 4000 5000 6000 7000

Learning   phase  

Extracted   "runs"  

Believable  noise  

          Sensor  dynamic  behavior  

qLine  segment  (triangle)  approxima8on  for  extrac8ng   process  dynamic  

Separator level

Separator level

80

65

Steady state

70

With IDV(8)

60

60

55

50

50

40

45

30

40

200

20

40

Hours

60

72

350

20

40

Hours

60

72

% %

          Final  result  

Resulted  spoofed  signals  are  extremely  accurate    

A and C feed
9.8

9.8

A and C feed

9.6

9.6

9.4

9.4

9.2 9.2

9 9

8.8

8.80

20

Hours 40

60

72

0

20

Hours40

60

72

kscmh kscmh

Find  X  differences    

          Seman@c--free  approach  

qThousands  of  sensors  signals  in  a  facility   qAll  plants  are  unique  

kg/h kPa gauge

3750 3700 3650 3600
0

Reactor pressure 2820

2810

2800

2790

2780

0

10

20

30

40

50

60

72

Hours

D feed

10

20

30

40

50

60

72

Hours

kscmh

A and C feed 9.8

9.6

9.4

9.2

9

8.8

8.6

0

10

20

30

40

50

60

72

Hours

          Anomaly  detec@on  

Entropy  metric  

kPa Entropy [bits]
kscm h Entropy [bits]

2820 1  
2810 2800 2790

Sensors {7;10} Sensor 10 0.8

Sensor 7 0.6

2  

Plant-wide entropy

2.5

0.4

2

0.2 1.5

27800

20

40

60 720

1

0.50

Plant--wide  entropy  increased  

20

40

60

72

Hours

10 3  

Sensor entropy
Steady state

With disturbances

Confidence interval

5 Reactor  unit  

00

10

20

30

40

Sensor  entropy  

Sensors

          Detec@on  

kPa gauge
Entropy [bits]
Entropy [bits]

2850 2800 2750 2700 2650 2600 25500

Spoofed  signal  
Reactor pressure

Effect  of  aYack  

20

40

Hours

60 72

3

Plant-wide entropy

2.5

2

1.5

Plant--wide  entropy  increased  

10

20

Hours 40

60

72

All  OK  in   reactor  unit  

Sensor entropy 10
Steady state

8

With disturbances Confidence interval

6

4

2

00

5 7 10 15 20 25 30 35 40

Sensors

Product   composi@on   has  changed  

          Approach  

          Correlated  sensor  signals  

          Correlated  sensor  signals  

kPa gauge kPa gauge
kPa gauge

2820 2810 2800

Reactor Pressure

3360 3350 3340 3330 3320 3310 33000

Stripper Pressure

10

20

30

40

50

60

70

Hours

2725

Product Sep Pressure

2720

2715

2710

2705

2700

2695

2690

26850

10

20

30

40

50

60

70

Hours

2790

27800

10

20

30

40

50

60

70

Hours

          Sensor  signal  clustering  

ScaYer  plot  to  visualize   correla@ons  between  signals  

Pressure

3300

3200

Reactor

3100
Me@s  tool  kit:  Graph   3000

Separator Stripper

par@@oning  for  sensor   2900

clustering  

2800

2700 0

10

20

30

40

50

60

70

Hours

Deg C kW
Deg C Deg C

          Correlated  sensor  signals   Compressor Work 290

280

270

260

2500

10

20

30

40

50

60

70

Hours

Separator Coolant Temp

96

94

92

94 90

93 88
92

860

10

20

30

40

Hours

50

60

70

91

90

Product Sep Temp

890

10

20

30

40

50

60

70

Hours

Stripper Temp 69

68

67

66

65

640

10

20

30

40

50

60

70

Hours

          Correlated  sensor  signals  

Mole %

Component A to Reactor 38

36

34

32

30

28

260

10

20

30

40

50

60

70

Hours

kscmh

Recycle Flow 35

34

33

32

31

30

290

10

20

30

40

50

60

70

Hours

kscmh

Reactor Feed Rate 51

50

49

48

47

46

450

10

20

30

40

50

60

70

Hours

          Cluster  entropy  

Sensors {5;6;23}
55

50

45

40

35

30

250

20

40

Hours

Signals  correla@on:  

+  

  

  

Correla@on  entropy:   LOW  

  
  
HIGH  

60

72

+  
  
LOW  

          Detec@on  

Spoofed  signals  appears  genuine  at  first  glance.     But  they  are  not  be  correlated  with  the  rest  of  the  signals  in  the  
cluster  of  related  sensors  

Sensors {5;6;23}
55

50

45

6

40 5
35 4
30

3

250

20

40

60

72

Hours

2

Time-window cluster entropy

Entropy [bits]

1

00

10

20

30 Hours40

50

60

70

Detec@on  in  the  presence  of  disturbance  in  reactor  unit  

          Detec@on  

XMEAS{5;6;23}
50

45

40

35

Time-window cluster entropy
6

300

5

20

40

60

72

Hours

4

Entropy [bits]

3

2

1

00

20

40

60

72

Hours

Detec@on  in  steady  state  (without  disturbances)  

          Powerful  aYacker    

He  spoofed  them  all!!!  
Sensors {7;13;16}
3400

3200
Spoofed  signals  
3000

2800

2600

6

0

20

40

60

72

Hours

5

Entropy [bits]

4

Spoofed  signals  will  all  look   genuine  but  won't  be   correlated  

3

2

1

0

20

Bad  luck!!!  
Time-window cluster entropy

30

40

50

60

70

Hours

          The  END  of  SCADA  triangles  

Marina  

Jason  

Arms  race  is  on!!  
ENCS  

          Jason  Larsen  was  challenged  

          Jason  Larsen  at  S4x15:  new  triangles  

Process State Uncertainty

B

C

Falling Slopes

Rising Slopes A
A
Rising Dead Time

D

C

B

Falling Dead Time

Slopes: Most confident correlation

          Marina  Krotofil  was  concerned  

          Establishing  trust:  chemical  analyzer  
Dead  @me:  6--15  min  

          Establish  trust  

Include  in  clusters  offline  signals  veracity  of  which  can  be   guaranteed  

Component A in reactor feed
33

Offline  signal  from  chemical  

32.5

analyzer  

mol%

32

Sensors {5;6;23}

55

31.5

50

45

40

310

5

10

15

20

25

35

Hours

30

250

20

40

60

72

Hours

Conclusions  

ENCS  

          Good  control  vs.  good  crypto  
Security  controls  must  span  all  the  way  to  the   applica@on  
  
q Security  specialists  define  required  security  protec8ons  
o E.g.  signatures  for  authen8ca8on  and  integrity  protec8on  
q Mathema8cians  do  their  magic  and  come   up  with  strong  cryptographic  primi8ves  and   algorithms  
q It  is  no  different  with  secure  controls    
o Specify  the  problem  and  a  desired  outcome   o Let  control  guys  do  what  they  do  best  

  Thank  you  
marina.krotofil@encs.eu  
jason.larsen@ioac8ve.com  

Damn  Vulnerable   Chemical  Process  

ENCS  

