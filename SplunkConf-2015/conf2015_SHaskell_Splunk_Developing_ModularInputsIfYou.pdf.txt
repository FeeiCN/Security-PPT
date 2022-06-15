Copyright  ©  2015  Splunk  Inc.  
Modular  Inputs  ­     If  You  Build,     They  Will  Come  
Sco8  Haskell  
Client  Architect,  Splunk  

Disclaimer  
During  the  course  of  this  presentaIon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauIon  you  that  such  statements  reflect  our   current  expectaIons  and  esImates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaIon  are  being  made  as  of  the  Ime  and  date  of  its  live   presentaIon.  If  reviewed  aTer  its  live  presentaIon,  this  presentaIon  may  not  contain  current  or   accurate  informaIon.  We  do  not  assume  any  obligaIon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiIon,  any  informaIon  about  our  roadmap  outlines  our  general  product  direcIon  and  is  subject  to   change  at  any  Ime  without  noIce.  It  is  for  informaIonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaIon  either  to  develop  the  features  
or  funcIonality  described  or  to  include  any  such  feature  or  funcIonality  in  a  future  release.  
2  

Agenda  
!  Building  a  modular  input  using  the  SDK  by  example  --  TA--zenoss     
3  

Modular  Inputs  101  

What  Is  A  Modular  Input?  
! Splunk  Enterprise  app  or  add--on  that  extends  the  Splunk  Enterprise   framework  to  define  a  custom  input  capability  
!  Treated  as  Splunk  naIve  input  --  Se#ngs  >  Data  >  Data  Inputs  
5  

Custom  Data  Input  Timeline  

No  Custom   Inputs  

Scripted   Inputs  

App  Setup   Screens  

Modular   Inputs  

1.x/2.x  

3.x  

4.x  

5.x  

6  

Modular  Inputs  vs.   Scripted  Inputs  

Scripted  Inputs  vs.  Modular  Inputs  

Capability   UI  ConfiguraIon  &  ValidaIon  
Permissioning   CheckpoinIng   Flexible  Data  AcquisiIon   SDK  Support   MulI--Pladorm  Support   Run  As  Splunk  User   Custom  REST  Endpoints   NaIve  Logging  

Modular  Inputs                    
System  User  Only   
 


Scripted  Inputs      


8  

This  or...  
[script://./bin/zenoss_wrapper.sh  --u  admin  --p  password  --a  h8p:// zenoss:8080  --z  America/Los_Angeles  --t  4320  --r  90  --s   2015--03--16T00:00:00  --index--closed--events  1  --index--cleared--events  1  -- index--archived--events  1  --index--suppressed--events  1  --index--repeat-- events  1]       sourcetype  =  zenoss--events       interval  =  60       index  =  zenoss        
9  

10  

Why  I  Chose  A  Modular  Input  
!  ProgrammaIc  collecIon  from  API  via  HTTP   !  Needed  ability  to  keep  state  and  filter  (checkpoint)   !  Quick  and  Flexible  configuraIon  and  (de--)acIvaIon  with  
permissions   !  Consumable  in  easy  to  understand  format  
11  

SDK  ImplementaIon  

PseuPdsoe--ucoddoe--c  Wodieth  SoDuKt  SDK  

Define   Scheme  

Validate   Input  

Read  XML   Config  

DDaaSSottttraarr  Xee    ----Maa    XTmmeMLx       Lt    

----scheme  

----validate-- arguments  

Checkpoint  

13  

Step  0  --  Create  A  Spec  File  

[zenoss_events://<name>]  

$SPLUNK_HOME/etc/apps/TA--zenoss/bin/ zenoss_events.py  

username = <value>

password = <value>

zenoss_server = <value>

device = <value>

start_date = <value>

index_closed = <value>

index_cleared = <value>

index_archived = <value>

archive_threshold = <value>

index_suppressed = <value>

index_repeats= <value>

checkpoint_delete_threshold = <value>

tzone = <value>

  
14  

Skeleton  Code  
from  splunklib.modularinput  import  *  
class  ZenossModInput(Script):           def  get_scheme(self):           def  validate_input(self,  validaIon_definiIon):           def  stream_events(self,  inputs,  ew):   if  __name__  ==  '__main__':           sys.exit(ZenossModInput().run(sys.argv))  
15  

Step  1  --  Define  IntrospecIon  Scheme  
16  

def  get_scheme(self):           scheme  =  S    c    h    e    m        e    (  "Zenoss  Events")           scheme.descripIon  =  "Modular  input  to  pull  events  from  Zenoss  API"           scheme.streaming_mode  =  "XML"           scheme.use_external_validaIon  =  True           scheme.use_single_instance  =  False  
        username  =  A     r   g    u     m       e    n     t   (  "username")           username.data_type  =  Argument.data_type_s   tring           username.required_on_edit  =  True           username.required_on_create  =  True           scheme.add_argument(username)   return  scheme  
17  

Step  2  --  Implement  RouInes  To  Validate   ConfiguraIon  
18  

def  validate_input(self,  validaIon_definiIon):           tz  =    v    a    l  i  d    a    I      o    n     _    d     e    fi     n     i  I    o     n     .  parameters.get("tzone")           interval  =  validaIon_definiIon.parameters.get("interval")           #  Validate  Imezone  exists  in  pytz  database           if  tz  is  not  None  and  tz  not  in  pytz.all_Imezones:                   raise  ValueError("Invalid  Imezone")           if  int(interval)  <  1:                   raise  ValueError("Interval  value  must  be  a  non--zero  posiIve  integer")  
19  

Name   Step  3Typ  e--    Stream  Data D aesscri p X<oMn   L  

def  stredaamta_   events(self,s  itnripnug t  s,  e    w      )  :  

event's  text  

        #  Alls  stcanrizpat     logic  goes  hsterirneg  

name  of  input  event  should  be  sent  to  

        for  e  in  events[`events']:                   eveInmte  =     Event(data  =flo  jsaot  n.dumps(Iem))e    in  seconds  +  3  decimal  places  for  milliseconds  

                ew.hwosrti t  e_event(evesntrtin)g     

event's  host  

index  

string  

index  name  to  write  event  

source  

string  

source  of  event  

sourcetype  

string  

sourcetype  of  event  

done  

boolean  

complete  event  or  event  fragment?  

unbroken  

boolean  

completely  encapsulated  in  this  event  object?  

20  

CheckpoinIng  

Do  I  Need  To  Checkpoint?  

Yes  

No  

Overlap  in  data  for  each  script  run?  

Snapshot  in  Ime  (ps,  lsof)?  

Avoid  data  duplicaIon?  

Unique  values  each  script  run?  

Filter  API  calls  --  device,  Ime?   Must  record  every  record  returned?  

22  

What  Does  Splunk  Provide?  
LocaIon  
        $SPLUNK_HOME/var/lib/splunk/modinputs/zenoss_events     
Access  To  LocaIon  
        def  stream_events(self,  inputs,  ew):                   checkpoint_dir  =  inputs.metadata.get("checkpoint_dir")  
23  

What  Don't  We  Provide?  
Everything  Else  --  Checkpoint  ImplementaIon  Is  On  You  
24  

Can  I  Use  The  KV  Store?  
!  No  SDK  convenience  methods  for  accessing  KV  Store   !    Use  service  object  from  SDK  and  GET/POST  to  REST  API   !    Challenge  searching  collecIon  with  dates  
25  

Logging  

message  =  "Oh  geez,  you  did  soSmeveertithy  ing  horribly  awful"   ew.log("ERROR",  message)   DEBUG  
INFO   WARN   ERROR   FATAL  
27  

UI  CustomizaIon  

29  

Manager  XML  
!  Override  Splunk  default  config  page   !  Customize  with  example  text  &  assign  default  values   !  Control  fields  displayed  during  create,  update,  and  list   !  $SPLUNK_HOME/etc/apps/TA--zenoss/default/data/ui/manager/
zenoss_events.xml     
30  

31  

Password  Management  

Strategies  

REST  storage/passwords  endpoint  

        +  Passwords  masked  on  entry  

        +  Encrypted  with  easy  clear  text  access  

        +  Hash  stored  in  local/passwords.conf  

        --  No  search  Head  Cluster  Support  
Manager  XML  

        +  Passwords  masked  on  entry  

        +  Search  Head  Cluster  Support  

        --  Clear  text  in  inputs.conf  --  file/directory  level  security  

Do  It  Yourself  

        +  Flexibility  

        --  AddiIonal  development  Ime  

          

33  

TesIng  Your  Script  

TesIng  Your  Script  
splunk  cmd  splunkd  print--modinput--config   scheme   stanza   $   SPLUNK_HOME/bin/splunk  cmd  splunkd  print--modinput--config  \   z   enoss_events  \   z   enoss_events://zenoss  \     |  $SPLUNK_HOME/bin/splunk  cmd  python  zenoss_events.py  
35  

Key  Takeaways  

!  The  SDK  makes  implemenIng  modular  inputs  EASY   !  Elevate  your  scripted  input  to  modular  input  and  share  on  
splunkbase   !  Get  the  code  and  play  with  it  
­ h8ps://github.com/sghaskell/TA--zenoss   ­ h8ps://splunkbase.splunk.com/app/2766/  
37  

THANK  YOU  

