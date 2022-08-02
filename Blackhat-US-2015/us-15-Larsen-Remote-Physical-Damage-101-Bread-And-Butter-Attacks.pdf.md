Physical  Damage  101:   Bread  and  Bu6er  A6acks  
Jason  Larsen   Blackhat  Vegas  2015  

ICS  Village  
· Lately  I've  had  complaints  that  I  only  talk  about   chemical  and  haven't  done  a  cool  power  talk  lately  
· This  will  be  mostly  chemical  and  manufacturing   · Power  guys  go  to  the  ICS  Village  try  to  crash  the  east  
coast  grid  with  Shaw  and  Culliss  

"SoKware  exploitaMon  can  be   described  as  unexpected  computa-on"                                 ­Sergey  Bra6us  
"CyberPhysical  exploitaMon  can  be   described  as  unexpected  physics"                                 ­Jason  Larsen  

Stages  of  OT  Hacking  

Access   Discovery   Control   Damage   Cleanup  

Financial   Regulatory  
Physical  

Iner:al   Exclusion   Resonance  
Wear   Surge   Latent  Abili:es  

We'll  be  talking  about  this  stuff  

Parents  Just  Don't  Understand  
Me  ­  "I  have  full  control  of  the  process"   Them  ­  "OK,  blow  it  up"   Me  ­  "Ummmm...  Give  me  a  few  weeks..."   Them  ­  "I  thought  you  said  you  had  full  control"   Me  ­  "There's  no  big  red  self  destruct  bu6on"   Them  ­  "I  thought  you  said  you  had  full  control"  

Why  Study  Physical  Damage  
· For  an  a6acker  compromising  a  process  is  only  the   start  of  the  work   ­ The  physics  are  much  more  challenging  
· Luckily  the  defender  mostly  just  gives  you  free  reign   once  border  defenses  are  defeated   ­ Maybe  defenders  should  study  a6ack?  
· Also,  destroying  stuff  is  just  fun  

Process  Specific  A6acks  

· There  are  more  process  specific  a6acks  than  there   are  generic  ones  

· Today  we're  going  to  cover  as  many  of  the  generic  

ones  as  I  have  Mme  

"The  process  constraints  must  be  maintained   .....     · The  peak  reactor  temperature  along  the  
length  of  the  tube  must  remain  below   200C  to  prevent  mechanical  damage  ....   · Liquid  levels  in  the  vaporizer,  separator,   absorber  base,  disMllaMon  column  base,  and   decanter  must  operate  within  ...   · Reactor  inlet  temperature  and  the  hot  side   exit  temperature  form  the  heat  exchanger   must  remain  above  130C  ....  

Consider  this..........  

StarMng  Demo  

Screen  shot  of  final  HMI  

When  the  reacMon  happens  in  that   other  place  

Place  ShiKing  Chemical  ReacMons  
The  chemical  reacMon  is  supposed  to  take  place  in  here  

Pressure  Relief   Valve  

Burst  Disc  

Catch  Basin  

ASME  RaMng  

Where  and  when  is  almost  complete  under  cyber  control  

Place  ShiKing  Chemical  ReacMons  
· The  problem  is  the  heat  
­ Most  reacMons  have  an  acMvaMon  temperature   ­ The  a6acker  has  to  find  a  way  to  heat  the  
reactants  in  some  other  part  of  the  plant    

When  water  doesn't  stop  suddenly  

Pressure  Transients  
· Pressure  transients  are  the  basis  for  most  a6acks  on   piping  infrastructure  

Water  Hammer  
· When  liquid  in  a  pipe  suddenly  comes  to  a  stop,  the   energy  has  to  go  somewhere  
· The  energy  involved  increases  exponenMally  with  pipe   size  

4  inch  pipe  60  feet  long  =  xxx  pounds   12  inch  pipe  60  feet  long  =  xxx  pounds  

PI*r2*h  

Water  Hammer  
· Whether  the  hammer  forms  depends  solely   on  the  speed  of  the  valve  closing  
· Large  industrial  valves  oKen  have  electronic   controls  for  valve  speed  and  profile  
· The  speed  of  the  transient  is  equal  to  the   speed  of  sound  in  the  liquid  
­ Roughly  the  speed  of  a  bullet  for  water  

Column  SeparaMon  
· If  the  stop  is  energeMc  enough,  water  can  be   turned  into  steam  on  the  surface  of  the  valve  
· This  steam  pressure  pushes  back  on  the  water   · An  instant  later,  the  steam  turns  back  into  
water  creaMng  a  vacuum   · This  creates  a  huge  pressure  transient  

Water  Hammer  HeaMng  
· Water  hammers  produce  heat   · All  that  energy  has  to  go  somewhere  and  most  
of  it  is  turned  into  heat   · A  hammer  can  be  used  to  heat  water   · Remember  this  during  place--shiKing  chemical  
reacMons  

Level  Boundary  Slug  

Gravity  Hammer   Steam  Void  Collapse  

When  gas  and  liquid  move  at  different   speeds  

Biphase  Slug  
Ripples  Form  
Ripples  Grow  
Dynamics  Change    

Biphase  Slug  with  Piston  Effect  
Slug  Forms   Gas  

Valve  Closes  Trapping  Gas   Trapped  Gas  

Gas  is  Compressed   Trapped  Gas  

Compress  

When  the  pressure  drops  below  zero  

Vacuum  Collapse  
· Lots  of  structures  can  take  very  high  posiMve   pressures  but  can  only  take  small  negaMve   pressures  
· As  we  replace  metal  pipes  with  new  types  of   plasMc  piping,  this  is  becoming  more  common  
--14.7  PSI  =  True  Vacuum  (on  earth  at  least)  

Steam  Collapse  
Ideal  Gas  Laws   P1V1    =    P2V2   T1                      T2  
1. Fill  a  space  with  hot  stuff  or  hot  gas   2. Remove  the  hot  liquid   3. Let  it  cool  down  

Steam  Collapse  
· Most  pressure  vessels   can  take  a  true  vacuum  
· The  interesMng  part   comes  from  all  the   external  stuff  we  bolt  on   to  the  pressure  vessel  

When  you  bring  something  in  out  of   phase  

Three--Phase  A6acks  

Newtonian  Mechanics  
· Speed  of  light  in  copper   · Rubber  band  effect   · It's  all  about  the  torque   · Big  guys  get  to  beat  up  li6le  guys   · Far  away  guys  are  the  same  a  li6le  guys  

Combining  
· Power  outages  caused  the  rupture  of  a  water   line  

MulM--AdapMve  
· Last  non--constant  derivaMve  of  a  polynomial  

Consider  this..........  

QuesMons  
Jason  Larsen   Jason.larsen@ioacMv  e.com  

