Copyright  ©  2015  Splunk  Inc.  
Visualizing Data from the Ground Up: Raw
Data to Interactive Graphics with Splunk  
Marshall  Agnew  
So>ware  Developer  at  Splunk  

Disclaimer  
During  the  course  of  this  presentaCon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauCon  you  that  such  statements  reflect  our   current  expectaCons  and  esCmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaCon  are  being  made  as  of  the  Cme  and  date  of  its  live   presentaCon.  If  reviewed  a>er  its  live  presentaCon,  this  presentaCon  may  not  contain  current  or   accurate  informaCon.  We  do  not  assume  any  obligaCon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiCon,  any  informaCon  about  our  roadmap  outlines  our  general  product  direcCon  and  is  subject  to   change  at  any  Cme  without  noCce.  It  is  for  informaConal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaCon  either  to  develop  the  features  
or  funcConality  described  or  to  include  any  such  feature  or  funcConality  in  a  future  release.  
2  

Why  VisualizaCon  MaSers  
Splunk  excels  at  understanding  machine  data  
3  

Why  VisualizaCon  MaSers  
Humans  are  excellent  at  seeing  visual  paSerns    
4  

Why  VisualizaCon  MaSers  
VisualizaCon  bridges  the  gap  
5  

Basic  visualizaCon   · Filter   · Format   · Sort   · Transform  
6  

Doing  BeSer   · Color   · Shape     · Size   · Knowledge  
7  

Doing  BeSer   · Color   · Shape     · Size   · Knowledge  
8  

And  BeSer   · More  Knowledge   · Complexity   · InteracCon  
    
9  

Splunk  Built--in  VisualizaCons  
Axis  charts:  Line,  Area,  Column,  ScaSer,  Bubble,  Bar  
10  

Splunk  Built--in  VisualizaCons  
CounCng:  Pie,  Filler  Gauge,  Marker  Gauge,  Radial  Gauge,  Single  Value  (now  counCng++)    
11  

Splunk  Built--in  VisualizaCons  
CounCng:  Pie,  Filler  Gauge,  Marker  Gauge,  Radial  Gauge,  Single  Value  (now  counCng++)    
12  

Splunk  Built--in  VisualizaCons  
Maps:  Marker  Map,  Choropleth  Map  
13  

Extending  Splunk's  CapabiliCes  
" Splunk  Web  Framework  and  JavaScript   " Splunk  Dashboard  Extensions,  Standalone  Views,  or  Standalone  
Splunk  apps   "  All  share  the  same  basic  concepts  
14  

Overview  

Search  Query  

Data  

Search  Manager   · Handles  communicaCon  with  Splunk  server   · Exposes  data  for  Splunk  views  

Simple  Splunk  View   · Helper  class  for  working  with  Splunk  data   · Communicates  with  Search  Managers   · Provides  hooks  for  data  formaing  and  rendering  

  

15  

  

Splunk  Web  Framework   Search  Manager   Data  
Simple  Splunk  View  

Coding  Demo  
16  

Concepts  Review  
"  Loading  JavaScript   "  Search  Managers   " SimpleSplunkView   "  Data  Formaing   "  Rendering   "  Token  Binding  
17  

Learning  More  
Other  Sessions...   "  AcceleraCng  your  SoluCon  Development  with  Splunk  Reference  
Apps  ­  Grigori  Melnik   "  Enhancing  Dashboards  with  JavaScript!  ­  Satoshi  Kawasaki   "  Advanced  InteracCons  Using  SimpleXML  ­  Mathew  ElCng  and  
Siegfried  Puchbauer  
18  

Learning  More  
"  Developer  guide:  hSp://dev.splunk.com/view/dev--guide/SP--CAAAE2R     "  Developer  reference  app:  hSps://splunkbase.splunk.com/app/1934/     "  Dashboard  examples  app:  hSps://splunkbase.splunk.com/app/1603/     " Splunk  Web  Framework  reference:  hSp://dev.splunk.com/webframework     " Splunk  Web  Framework  Toolkit:  
hSps://splunkbase.splunk.com/app/1613/    
19  

THANK  YOU  

