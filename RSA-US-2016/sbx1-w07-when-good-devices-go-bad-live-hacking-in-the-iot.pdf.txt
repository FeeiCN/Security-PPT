SESSION  ID: SBX1-W07
Hacking  the  IoT:   When  Good  Devices  Go  Bad
#RSAC

Jesus  Molina   @verifythentrust  
Joe  Gordon
Balint  Seeber   @spenchdotnet

#RSAC
What  is  the  IoT?
The  "Internet  of  Things"  is  a  broad  buzz  phrase:   Imagine  any  one  of  the  many  devices/objects  you  (knowingly/ unknowingly)  interact  with  on  a  daily  basis   Embed  communications  module  for  control  and/or  telemetry   Commonly  connects  to  Internet  (`Cloud'),  or  to  Smart  Phone
2

#RSAC
IoT  Communications
IoT  enabled  by  cheap  communications  hardware   Wireless  --  portable,  cheaper  than  installing  cabling  (copper)   Commodity  Wi--Fi  chips,  Bluetooth  Low  Energy  &  embedded   processors   Optimised  proprietary,  IoT--specific  protocols  in  development  
Long--life,  low  power  consumption
3

#RSAC
Future  IoT  Trends
Various  predictions  based  on  current  production  &  low  cost,   reuse  of  IoT--enabling  hardware/software/firmware   50  billion  connected  devices  by  2020  
Just  a  few  years  away!   Smallest,  insignificant  devices  will  be  able  to  communicate   wirelessly
4

#RSAC
Ubiquity  of  the  IoT
In  the  home   Security,  lighting  
In  the  enterprise   HVAC  
In  Smart  cities   Traffic  flow,  lighting  
In  infrastructure
5

#RSAC
The  Good,  The  Bad  &  The  ???
6

#RSAC
The  Good,  The  Bad  &  The  ???
7

#RSAC
The  Good,  The  Bad  &  The  ???
8

#RSAC
The  Good,  The  Bad  &  The  ???
9

#RSAC
IoT  Security
History  shows  that  security  is  never  implemented  correctly   Time--to--market  pressure   Lack  of  understanding  of  good  security   Poor  code  quality  &  reuse   Upgrade  later  
Vulnerabilities  persist  and  propagate  from  reference  designs
10

#RSAC
Our  IoT  Devices
Home  automation   ZigBee--enabled  door  lock  (open  from  your  Smart  Phone)  
Home  security   Wireless  alarm  system  (no  more  wires  to  install!)  
Toys   iSpy  Tank
11

#RSAC
Our  IoT  Devices
NEST   Hello  Barbie   Cayla   Baby  Monitor   Dog  Shock   Collar   Light  Bulbs
12

#RSAC
Communications  Hardware
Software  Defined  Radio   Re--configurable,  programmable  radio   Signals  decoded  &  generated  on  computer   SDR  hardware  provides  RF  front--end
13

#RSAC
Communications  Software
GNU  Radio   Free  Open  Source  Software   Flow--based  DSP  framework   Active  developer  community,  many  Out  Of  Tree  modules   Supports  variety  of  SDRs
14

#RSAC
ZigBee  Door  Lock
Keypad  for  electronic  control   Wireless  module  to  connect  to  Home  Automation  hub  
Control/monitor  from  Smart  phone   ZigBee  &  Z--Wave  options   `Uses  encryption'
15

#RSAC
ZigBee  Door  Lock
"Zigbee  Exploited:  The  Good,  the  Bad  and  the  Ugly"   Tobias  Zillner  
https://cognosec.com/blackhat--defcon--2015/
16

#RSAC
ZigBee  Door  Lock
Encrypted   Control  &  Status

Sniff  Link  Key

Encrypted  `Unlock'
17

#RSAC
Wireless  Home  Alarm  System
Avoids  wired  installation   Uses  simplistic   communications   protocol  between   controller  &   security  sensors
18

#RSAC
Wireless  Home  Alarm  System
"Home  Insecurity:  No  alarm,  False    alarms,  and  SIGINT"   Logan  Lamb  
https://media.defcon.org/ DEF%20CON%2022/ DEF%20CON%2022%20presentations/ Logan%20Lamb/
19

#RSAC
Wireless  Home  Alarm  System
Door  opening
Jamming
20

#RSAC
iKettle
Leaks  Wi--Fi  network  credentials  to   attacker   Compromises  security  of  private  network
21

#RSAC
iKettle
Wi--Fi  de--auth
22

#RSAC
iSpy  Wi--Fi  Tank
Re--purpose  toy  to  sniff traffic  on  connected   Wi--Fi  network   No  access  control   Hard--coded  passwords
23

#RSAC
iSpy  Wi--Fi  Tank
24

#RSAC
Cayla
Bluetooth  headset   No  PIN   Eavesdropping   Play  any  audio
25

#RSAC
Apply:  Preparing  for  the  IoT
Next  week:  Be  fully  aware  of  all  wireless  capabilities  of  devices   Infrastructure  radio  capabilities  
3  months:  Minimize  wireless  attack  surface   Attacks  via  RF  domain  are  cheap   Do  not  rely  on  Security  Through  Obscurity  
6  months:  Understand  security  implications   Design  security  in  from  the  beginning   Hire  talent  that  understand  good  security  practice/protocols
26

SESSION  ID:
Hacking  the  IoT:   When  Good  Devices  Go  Bad
#RSAC

Jesus  Molina   @verifythentrust  
Joe  Gordon
Balint  Seeber   @spenchdotnet

