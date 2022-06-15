Copyright  ©  2015  Splunk  Inc.  
Paint  By  Number:   What's  New  in   VisualizaMon  
Michael  Porath  
Product  Manager,  Splunk  
Geoffrey  Hendrey  
Architect,  Splunk  
  

Disclaimer  
During  the  course  of  this  presentaMon,  we  may  make  forward  looking  statements  regarding  future  events   or  the  expected  performance  of  the  company.  We  cauMon  you  that  such  statements  reflect  our  current   expectaMons  and  esMmates  based  on  factors  currently  known  to  us  and  that  actual  events  or  results  could   differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  contained  in  our   forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward--looking  statements  made   in  the  this  presentaMon  are  being  made  as  of  the  Mme  and  date  of  its  live  presentaMon.  If  reviewed  aXer  
its  live  presentaMon,  this  presentaMon  may  not  contain  current  or  accurate  informaMon.  We  do  not   assume  any  obligaMon  to  update  any  forward  looking  statements  we  may  make.       
In  addiMon,  any  informaMon  about  our  roadmap  outlines  our  general  product  direcMon  and  is  subject  to   change  at  any  Mme  without  noMce.  It  is  for  informaMonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaMon  either  to  develop  the  features  
or  funcMonality  described  or  to  include  any  such  feature  or  funcMonality  in  a  future  release.  
2  

You  Asked  --  We  Listened  

Improvements   towards    
Be^er  Data  Analysis  

Improved   Dashboard   VisualizaMons  
3  

New  Geo   VisualizaMon  Type  

VisualizaMon   Improvements  

Data  Labels  
· Labels  individual  data  points   · Min/Max  points  only,  or  all  points  
5  

Independent  Axes  
· Split  Series  can  now  have  their  independent  Y  Axes   · Helps  compare  spikes  and  trends  across  series  
6  

Single  Value   VisualizaMon  

Dashboards  are  Far  Away  
8  

ExisMng  

Single  Value  
Completely  Redesigned  
New  

9  

Single  Value  
Small  Space,  High  InformaMon  Density  
... | timechart max(value) span=1w No  JS  coding  /  CSS  styling  necessary!  
10  

Single  Value  
Color  Modes  

Value  Range  Map,   custom  thresholds  

Trend  up/down,   Can  be  inversed  
11  

GeospaMal  Analysis   And  VisualizaMon  

Maps  in  Splunk  
Pre  Splunk  Enterprise  6.0   Community  Supported  Apps   E.g.  Google  Maps  add--on  
13  

Maps  in  Splunk  
Splunk  Enterprise  6.0   Cluster  Maps   Splunk  Tiles   |  geostats     
14  

Maps  in  Splunk  
Splunk  Enterprise  6.1   UI  integraMon   Format  Editor  
15  

Maps  in  Splunk  
Splunk  Enterprise  6.3   ?  
16  

Choropleth  Maps  
Newest  member  of  the  visualizaMon  family  in  6.3     
17  

What  is  a  Choropleth?  
Choropleth  --  from  Greek:  "a  mulMtude  of  regions"    A  themaMc  map  with  areas  shaded  in  proporMon  to  the  
measurement  of  a  variable    Visualizes  how  a  measurement  varies  by  geographic  region  
18  

Built--in,  Ready  to  Use  

Countries  of  the  world  

50  States  of  US  +  DC  

19  

Use  Publically  Available  Region--data  

Geo--tagged  events  

Splunk  

Region  Datasets  (.kmz  files)  

High  Fidelity   Geo  Data  

Current  Severe     Weather  Zones  

State,  county,  city,     congressional  boundaries  
20  

Neighborhoods,  building  footprints  

Match  Events  to  Complex  Shapes  in  Real--Mme  
 Which  polygon  contains  37.7792523,-122.4194366?    A  human  eye  can  easily  answer  this    For  soXware  the  "Point  in  polygon"  problem  is  
harder  
­ Millions  of  verMces  per  region  dataset  
 Every  event  must  be  checked  against  every  polygon  
21  

Relevant  SPL  Commands  
lookup     Use  the  lookup  command  to  match  a  polygon  to  a  laMtude  and   longitude  coordinate  
   stats   Use  stats  commands  to  create  per--polygon  aggregates      geom   Use  geom  command  to  render  polygons  on  a  map  
  
22  

GeospaMal  Lookup    
1.  Lookup  features  (=  polygons)  

lat

lon

amount

37.7833 36.9719 36.1215

-122.4167 -122.0264 -115.1739

46.00 89.25 52.50

lookup!geo_us_states !!!!latitude!as!lat!
!!!!longitude!as!lon! !!!!output!featureId

lat 37.7833 37.7814 36.1215

lon

amount featureId

-122.4167

46.00 California

-122.0264

89.25 California

-115.1739

52.50 Nevada

The  name  of  the   surrounding  polygon  is   a^ached  to  your  event   in  the  featureId  field  

23  

GeospaMal  Lookup    
2.  Aggregate  across  features  

lat

lon

amount featureId

37.7833 37.7814 36.1215

-122.4167 -122.0264 -115.1739

46.00 California 89.25 California 52.50 Nevada

featureId California Nevada

stats sum(amount) as amountTotal by featureId
amountTotal 135.25 52.50

24  

GeospaMal  Lookup    
3.  Visualize  on  a  map  

featureId California Nevada

amountTotal 135.25 52.50

geom%geo_us_states

25  

End--to--End  Example  

... | lookup geo_us_states
latitude as lat longitude as lon | stats count by featureId | geom geo_us_states

1.  Lookup  features  (=  polygons)  
2.  Aggregate  across  features   3.  Visualize  on  a  map  

26  

Rendering  Polygons  
Always  as  much  detail  as  needed,  never  more  
Low  Detail   (zoomed  out)  
High  Detail     (zoomed  in)  
27  

Demo  

Review:  CreaMng  a  GeospaMal  Lookup  Index  
· Pick  a  KMZ  (zipped  KML)  containing  polygons   · OpMonal:  Use  Google  Earth  to  view/verify  the  boundaries   · Setup  lookup  via  UI  /  in  the  cloud  
· Upload  .kmz  file  via  lookup  UI   · Setup  lookup  definiMon  with  lookup  type  "GeospaMal"  
· Setup  lookup  manually  
· Move  .kmz  to  lookup  directory   · Set  external_type=geo  in  transforms.conf
· Splunk  creates  an  efficient  geo--index  replicated  across  indexers  
29  

Choropleth  Maps  
Use  Cases  
  
Supports  any  KMZ  file  with  Polygons      Examples:     ·Sales  Regions   ·Campus  Maps   ·Districts   ·ZIP  codes   ·Census  Tracts   ·Geofencing  areas  
30  

Use  Cases  
GeospaMal  AnalyMcs  
31  

Use  Cases  
Geofencing  
32  

Use  Cases  
Geofencing  

lingering  for  a     certain  period    
33  

leaving  an  area   entering  an  area  

Use  Cases  
Campus  Map:  E.g.  Show  badge  access  
34  

Use  Cases  
Hexagonal  grid:  Fine  grained  heat  map  
35  

Examples  Custom  Polygons  
New  York  neighborhoods:  average  taxi  ride  duraMon  
36  

Single  Value  redesigned     for  Dashboards  

Summary  
GeospaEal  Lookup   based  on  custom    
boundaries  

High  fidelity     Choropleth  maps   based  on  custom  shapes  

36.104643, -115.165080
Las  Vegas?   MGM  ConvenMon  Center?  
United  States?  
37  

THANK  YOU  

