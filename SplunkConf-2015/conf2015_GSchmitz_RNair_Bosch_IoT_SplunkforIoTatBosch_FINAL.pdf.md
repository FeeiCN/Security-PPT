Splunk  .conf  2015  
Gerrit  Schmitz   Renjith  Nair  
Senior  System  Engineer,     Bosch  SoDware  InnovaGons  
Copyright  ©  2015  Splunk  Inc.  

Bosch  So(ware  Innova0ons  

Agenda  

1   About  Us   2   Splunk  Architecture  @Bosch--SI   3   Splunk  Monitoring  @  Bosch--SI   4   Splunk  in  Bosch  IoT  Business   5   Past  and  Future  Challenges  

About  Us  

Bosch  So(ware  Innova0ons  

About  Us  

·  Gerrit  Schmitz  
Senior  System  Engineer     
·  Renjith  Nair  
Senior  System  Engineer     
·Combined  Splunk  Experience  of  8  years+  

Bosch  So(warBe  Ionnsocvah0o  Snos   Dware  InnovaGons  Worldwide  

Chicago    
Sales     MarkeGng   Prof.  Services  
Palo  Alto    
Sales    

Berlin  
Corporate  FuncGons   Sales  &  MarkeGng   Product  Development   Professional  Services  
Immenstaad    
Corporate  FuncGons   Sales  &  MarkeGng   Professional  Services   Product  Development  

Bosch  So(ware  Innova0ons  
§ SoDware  and  system  services   for  enterprise  soluGons  in  the  IoT  
§ Experience  ranges  from  complex   soDware  systems  to  domain  soluGons  
§ 700  associates  worldwide  

Prosyst  ­  Cologne/Sofia  
Sales  &  MarkeGng   Product  Development   Professional  Services  
Waiblingen  
Sales   System  Technology  
System  Projects   Professional  Services   Product  Development  

Shanghai  
Sales   Professional  
Services     
Singapore  
Sales  &  MarkeGng   Professional  Services   Product  Development  
System  Projects  

Bosch  SoDware  InnovaGon     s  

IoT  Vision  ­  A  Connected  World  

Industry   Mobility   Energy  

Smart  Home  

Smart  City  

The  Things  of  Bosch  

Splunk  Architecture   @  Bosch  SI  

Splunk  Architecture  @  Bosch  SI  

3950  km  

Stu^gart  

10250  km   Singapore  

Splunk  Architecture  @  Bosch  SI  
 Five  Search  Heads    Seven  Indexers    Eleven  Heavy  Forwarders    Approximately  150  Universal  Forwarders  
 Two  Masters  (both  Stu^gart)    Two  Indexer  Clusters  (stretched)    One  Search  Head  Cluster  (stretched)  

Splunk  As  A  Monitoring   Tool  

Bosch  So(ware  Innova0ons  

    

ReporGng  

ApplicaGon   Monitoring  
System  Monitoring  

   PoC  --  Splunk  As  a  Monitoring  Tool  

OpsMonK  

Splunk  As  A  Monitoring  Tool  

Splunk  As  A  Monitoring  Tool  

Alerts  

Splunk  As  A  Monitoring  Tool  

Alerts  

Splunk  As  A  Monitoring  Tool  

Alerts  

Splunk  As  A  Monitoring  Tool  

Maintenance  

Splunk  As  A  Monitoring  Tool  

Splunk  As  A  Monitoring  Tool  

Splunk  As  A  Monitoring  Tool  

Splunk  As  A  Monitoring  Tool  

Splunk  In  Bosch  IoT  Business  

eMobility  

Bosch  IoT  Business  
Industry  4.0  

Bosch  IoT  Business  
Energy  ­  Virtual  Power  Plant  
Intelligent  Tools  

Connected  lawn  mower  Indego  
Manage your connected devices with the touch of a finger
The Bosch Indego is the first robotic lawn mower with a free GSM connection that can be operated simply and conveniently using an
app.

The image cannot be displayed. Your computer may not have enough memory to open the image, or the image may have been corrupted.

Connected  la--w   n  mower  Indego       

The image cannot be displayed. Your computer may not have enough memory to open the image, or the image may have been corrupted. Restart your computer, and then open the file again. If the red x still appears, you may have to delete the image and then insert it again.

Mobile  
data  

The image cannot be displayed. Your computer may not have enough memory to open the image, or the image may have been corrupted. Restart your computer, and then open the file again. If the red x still appears, you may have to delete the image and then insert it again.

The image cannot be displayed. Your computer may not have enough memory to open the image, or the image may have been corrupted. Restart your computer, and then open the file again. If the red x still appears, you may have to delete the image and then insert it again.

User Interface:
The image cannot be displayed. Your computer may not have enough memory to open the image, or the image may have been corrupted. Restart your computer, and then open the file again. If the red x still appears, you may have to delete the image and then insert it again.

Internet  
The image cannot be displayed. Your computer may not have enough memory to open the image, or the image may have been corrupted. Restart
Business  Portal  

Connected  lawn  mower  Indego  

Connected  lawn  mower  Indego  

Challenges  

Past  Challenges  
­ We  use  our  own  SSL  cer0ficates.     This  is  supported,  but  difficult.  
­ We  isolate  mul0ple  Splunk  processes  on  the  same  host.   This  is  not  supported,  and  also  difficult.  
­ We  run  globally  distributed  Splunk  clusters.   This  is  not  supported,  but  was  quite  easy.  
­ Our  Splunk  is  completely  highly  available.     Including  Master  and  TCP  Inputs  
If  you  want  to  do  something  similar,  we  are  here  to  help  J  

Past  and  Future  Challenges  
­ How  could  Splunk  extract  data  from  an  embedded   device?  
ê Universal  forwarder   available,  but  not  officially  supported  for  ARM     h^ps://splunkbase.splunk.com/app/1611/    
ê TCP  Input  cannot  be  access  protected  (safe  for  client  cerGficates)  
ê That  leaves  the  REST  Interface   h^p://docs.splunk.com/DocumentaGon/Splunk/latest/RESTREF/RESTinput#receivers.2Fsimple  
­ Server  AuthenGcaGon:  via  SSL  CerGficate   ­ Client  AuthenGcaGon:  via  Username/Password   ­ Client  AuthorizaGon:  
ê edit_tcp  permission  required   ê Is  it  a  good  idea  to  grant  this  to  a  large  number  of  devices?  

Future  Challenges  
To--Do  List:   ­ Migra0ng  from  single--0er  to  mul0--0er  storage.   ­ Use  roles  as  distribu0on  lists  for  alerts.    
Splunk  knows  the  mail  addresses  from  LDAP,  why  can't   we  send  alerts  to  a  whole  role?  
­ Limit  volume  by  index  ­  not  indexer.  
Seems  to  require  a  change  in  Splunk.  So  far  only  alerGng   works.  
­ Automa0cally  provision  new  tenants.   ­ Integrate  more  authen0ca0on  mechanisms  
(oAuth).  

THANK  YOU  
  
      h^p://blog.bosch--si.com   h^p://www.bosch--si.com/     

