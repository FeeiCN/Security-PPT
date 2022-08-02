Copyright  ©  2015  Splunk  Inc.  
GeDng  Started  with   Maps  
Robb  Bi;ner   Michael  Porath  
Product  Managers,  Splunk  

Disclaimer  
During  the  course  of  this  presentaIon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauIon  you  that  such  statements  reflect  our   current  expectaIons  and  esImates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaIon  are  being  made  as  of  the  Ime  and  date  of  its  live   presentaIon.  If  reviewed  aTer  its  live  presentaIon,  this  presentaIon  may  not  contain  current  or   accurate  informaIon.  We  do  not  assume  any  obligaIon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiIon,  any  informaIon  about  our  roadmap  outlines  our  general  product  direcIon  and  is  subject  to   change  at  any  Ime  without  noIce.  It  is  for  informaIonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaIon  either  to  develop  the  features  
or  funcIonality  described  or  to  include  any  such  feature  or  funcIonality  in  a  future  release.  
2  

Intro  

 Robb  Bi'ner    Product  Manager:  Splunk  Light    Map  Geek    

 Michael  Porath  
 Product  Manager:  VisualizaIon  and   Analysis  
 VisualizaIon  Nerd  
­ Background  (maps  added  in  v5)   ­ Many  new  enhancements     

A  Splunk  instance  walks  into  a  bar...  
4  

5  

#  Liters  of  pure  alcohol  per  capita  
6  

#  of  Beer  Servings  per  year  
7  

#  of  Wine  Servings  per  year  
8  

#  of  Spirit  Servings  per  year  
9  

More  or  less  than  recommended?  
10  

Mapping  is  easy  (really)  
 DEMO  
 Marker  Map  
­ ExisIng  Lat/Lon   ­ Generated  Lat/Lon  
Choropleth  
­ Lookup  based   ­ AggregaIon  based  
 Styling     

Mapping  Gallery  

Elements  of  Mapping  
13  

Elements  of  mapping  
Point  
Las Vegas Longitude: 36.1215° N Latitude: 115.1739° W

Elements  of  mapping  
Lines  
Path   Sequence  in  Time   Crossing  boundaries     

Elements  of  mapping  
Polygons  
Inside/Outside   Entering/Leaving   Lingering   Summarize     

1  =  World  

Elements  of  mapping  
Zoom  level  

10  =  City  

19  =  House  

Mapping  in  Splunk  

What  you  need  to  build  a  map?  

Marker  Map  

Choropleth  Map  

Event  that  contains  laItude  and  longitude   or  
Country  /  State  /  Polygon  name  

Making  Data  Mappable  

Marker  Map  

Choropleth  Map  

Lat/Lon  
Street  Address   ZIP+4   Cell  Tower   IP  Address  
GPS  

Polygon  
Name   FIPS  
Code  

AggregaIon:  Clusters  
| geostats latfield=latitude longfield=longitude count by ...
· Generates  staIsIcs  which  are  clustered  into  geographical  bins  to  be   rendered  on  a  world  map.    
· Events  are  clustered  based  on  laItude  and  longitude     · StaIsIcs  are  evaluated  on  the  generated  clusters   · The  staIsIcs  can  be  grouped  or  split  by  fields  using  a  "by"  clause  
21  

AggregaIon:  Polygons  
| stats count by ... | geom geo_us_states featureIdField=state
· geom  command  adds  a  field,  named  geom,  to  each  event   · This  field  contains  geographic  data  structures  for  polygon  geometry  in  JSON  
and  can  be  used  for  Choropleth  Map  visualizaIon  type.   · This  command  requires  an  external  lookup  with  external_type=geo  to  be  
installed.  
22  

Tiles  
Splunk  Tiles   Packaged  with  every  Splunk  version   Offline  usage  OK   Zoom  Levels  1--7   Muted  Colors.  Perfect  for  Data  Overlays.     
Open  Street  Map   Packaged  with  every  Splunk  version   Only  online   Zoom  Levels  1--19  

Tiles:  AlternaIves  
List  of  >le  providers   h;p://leaflet--extras.github.io/ leaflet--providers/preview/  

25  

InterpretaIon  
Is  this  really  only   Germany?  

Normalize  
Source:  xkcd.com  
If  possible,  normalize!   · By  populaIon  /  user  density   · By  percent  of  a  baseline   · Compared  to  a  previous  point  in  Ime  

Mapping  is  easy  and  useful  

Recap!  

New:  Choropleth  Maps   Use  Custom  Tiles  

Q&A  

Wrap  up  
 Coming  up  in  this  room   Paint  by  Number:  New  Visualiza>ons  in  Splunk  6.3  
 Resources:  
­ Tile  providers:  h;p://leaflet--extras.github.io/leaflet--providers/preview/   ­ Marker  Maps  Docs:  h;p://docs.splunk.com/DocumentaIon/Splunk/6.3.0/
SearchReference/Geostats   ­ Choropleth  Docs:  h;p://docs.splunk.com/DocumentaIon/Splunk/6.3.0/Viz/
Choroplethmaps  

THANK  YOU  

