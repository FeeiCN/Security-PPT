Blackhat  Vegas,  2011  
PPI--Geoloca6on:  The  next  genera6on  of   802.11  visualiza6on  and  geo--loca6on  

Your  presenter  
· Jon  "Johnny  Cache"  Ellch  
­ Co--Author:  Hacking  Exposed:  Wireless   ­ Many  802.11  cracking  u6li6es   ­ Aspiring  Atari  2600  programmer   ­ Wireless  Engineer,  Harris  Corp.   ­ Youngest  obsolete  guy  around.  

802.1  visualiza6on  now:  

Mo6va6on  
· The  world  has  too  many  file  formats  for  surveys:   ­ .ns1,  .ns2,   ­ .netxml,  .gpx,   ­ .csv,  .wU,  Blaarhg...  
· Lets  clean  up  this  mess.  
­ Why  can't  all  that  data  be  stored  in--line  with  the  packet?     

Per--Packet  Informa6on  
· PPI  for  short.   · Developed  by  CACE  in  2008   · Allows  applica6ons  to  store  Per--Packet  
Informa/on  in  standard  pcap  file  without   breaking  compa6bility  with  tools.  

What  PPI--GEOLOCATION  gets  us  
· Ability  to  look  at  a  single  pcap  file  and  tell   when,  where,  and  what  captured  a  given   wireless  packet.  
· Ability  to  create/modify  this  data  across  a   wide  variety  of  tools.  
· Most  obvious  use:  Universal  visualizer  

Per--Packet  Informa6on    

What  do  we  store?  
· Well,  Lets  start  with  the  GPS   · G  =  GPS()   · G.La6tude=40.787743   · G.Longitude=--73.971210   · g  =  GPS(str(G))  #Cause  the  packet  to  be  built   · g.show2()  

Well  that's  a  start,  but..  
· What  direc6on  were  we  travelling?   · Where  was  the  antenna  pointed?   · Which  way  was  the  car  poin6ng?   · We  need  a  Vector  

Vector  details  
· Vectors  specify  arbitrary  3--dimensional   orienta6on.  
· Vectors  can  be  rela6ve  to  each  other,  or   rela6ve  to  earth.    
· Vector  Characteris6c  bitmask  is  used  to   denote  what  vector  represents.  Most  likely   uses  are  Direc6on  of  Travel,  Front  of  Vehicle,   and  Antenna.  

Vector  
· V  =  Vector()   · V.VectorFlags="Rela6veToEarth"   · V.VectorChars="Direc6on  of  Travel"   · V.Pitch=10.0   · V.Heading=22.5  

But  where  is  the  antenna  poin6ng?  

Okay,  that  was  cool,  But..  
· What  good  is  knowing  the  orienta6on  if  we   don't  know  what  sort  of  antenna  is  alached?  

Antenna  tag  
· A  =  Antenna()   · A.gain  =  16   · A.horizbw  =  30   · A.ModelName="SA24--120--9"  

Okay  that  was  cool,  But..  
· What  about  how  fast  we  were  going?   · Did  I  say  velocity?  I  meant  Accelera6on.   · And  temperature.   · And  Humidity  (?)  

S  =  Sensor()  
· S.SensorType="Velocity"   · S.Val_T  =  20.0     

Okay  that  was  cool,  But..  
· I  was  told  there  would  be  prely  pictures!  

Kismet--date.nelxt  
Visualizing  the  data  with  giskismet  

Visualizing  the  same  data  with  ppi--viz  

Okay  that  was  cool,  But..  
· You've  been  working  on  this  for  a  year  and  all   you  have  are  some  bar  graphs  in  GE?  

Say  hello  to  my  lille  friend!  
WiFi  Cannon:  
+5  Charisma   +8  gain  (dBm)   30°  horiz  bw  

2008  Cobalt  SS  
· 260  HP  Supercharged  Ecotec  Engine   · Ridiculous  wing  (+5  HP)   · Sunroof  op6onal  

Directed  Percep6ons  Servo  
· 360°  Pan   · +/--  30°  Tilt   · 100%  sosware  controlled    

WiFi  Cannon  
· 8  dBi  antenna   · 30°  horizbw    

Servo  Bot  rollout!  

These  two  packets  

Mul6path:  

These  two  packets:  
Bounced  off     this  guys  house.  

These  two  packets:  

These  two  packets  

Okay,  That  was  cool  
· But  nothing!  It  was  cool.   · But  where  is  all  this  code?  
­ Wireshark:  merged.   ­ Scapy:  merged  (/contrib)   ­ Kismet:  merged   ­ SDK  (hlp://www.govcomm.harris.com/solu6ons/products/csp--
white--papers.asp)  

Get  The  SDK:  
· SDK  Includes:  
· C++  Library  for  reading/wri6ng  tags  (Linux/Windows)   · Python  state  machine  that  illustrates  proper  
interpreta6on   · Ppi--viz--dev:  Developer  visualizer     · Ppi--viz:  Basic  signal  strength  visualizer   · hlp://www.govcomm.harris.com/solu6ons/products/
csp--white--papers.asp  

Suppor6ng  vendors  
You're  Welcome.  

Thanks  to    
· Charlie,    Jody,  Tyler,  Megan,  Manny  ,Dragorn,   Phillipe,  Gerald,  R15,  Pandy,  Craig,  shegget,   Kiersten,  etc.  
· Nick  kind--of--a--big--deal  Petrillo  +  Pusscat   · My  (inten6onally--vague)  friend  Josh.     · HD,  skape,  rjohnson    +  the  rest  of  uninformed  
and  219.    

