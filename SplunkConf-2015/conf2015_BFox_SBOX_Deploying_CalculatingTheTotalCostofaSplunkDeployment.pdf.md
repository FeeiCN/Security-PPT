Copyright  ©  2015  Splunk  Inc.  
Understanding The Total Cost of Ownership (TCO) in a Splunk Deployment
Bob Fox
VP Technical Services, SBOX Inc

Disclaimer  
During  the  course  of  this  presenta>on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau>on  you  that  such  statements  reflect  our   current  expecta>ons  and  es>mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta>on  are  being  made  as  of  the  >me  and  date  of  its  live   presenta>on.  If  reviewed  aMer  its  live  presenta>on,  this  presenta>on  may  not  contain  current  or   accurate  informa>on.  We  do  not  assume  any  obliga>on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi>on,  any  informa>on  about  our  roadmap  outlines  our  general  product  direc>on  and  is  subject  to   change  at  any  >me  without  no>ce.  It  is  for  informa>onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga>on  either  to  develop  the  features  
or  func>onality  described  or  to  include  any  such  feature  or  func>onality  in  a  future  release.  
2  

About  Bob  
 VP  Technical  Services  at  SBOX  Inc.    Formerly  of  Splunk  (2006--2013)      Formerly  of  Sun  Microsystems  (1999--2002)    Wall  St.  IT  Opera>ons  and  Data  Center  
Management    Roles    Recovering  DBA,  Unix  Hack,  Author  and  Dad  
   bob@sboxinc.com  

About  SBOX,  Inc.  
 Crazy  mash  up  of  Splunk  Professionals  and  InfoSec  Specialists    Shipping  appliances  since  2013    San  Francisco,  CA  based    We  sell  the  SBOX  Security  
Analy>cs  Appliance     (Powered  by  Splunk)    Come  visit  our  booth!  

Presenta>on  Objec>ves  
 Introduce  the  Total  Cost  of  Ownership  model  used  at  SBOX,  Inc.    Bring  to  light  the  myriad  of  `soM  costs'  involved  in  enterprise  
soMware  deployments    Present  advice  for  cost  avoidance  (or  at  least  cost  discovery)  

My  Challenges  Today  
 Keep  the  audience  awake      Make    "Total  Cost  of  Ownership"  seem  somewhat  exci>ng.  

What  is  TCO  
Total  cost  of  ownership  (TCO)  is   a  financial  es>mate  intended  to   help  buyers  and  owners   determine  the  direct  and  indirect   costs  of  a  product  or  system.    

Costs  of  a  Splunk  Deployment  
(Commodity  Server)  
DIRECT   License  +  Server  +  Disk   +  Maintenance  +  Training  +  PS  
   INDIRECT   OS  +  Tuning  +  Security  +  Installa>on  
+  Time  

Model  Assump>ons  

Splunk  License  
100  GB  

Reten>on  
1  Year  

Cost  Window  
3  Years  

Cost  Assump>ons  

Server  
$8K  

SAN  
$3K/TB  

IT  OPS  
$50/Hr  

Splunk  Deployment  Timeline  

Splunk  Deployment  Timeline  
Not  drawn  to  scale!  

Methodology  
 Break  out  major  components:  
­ Acquire   ­ Deploy   ­ Configure    
 Separate  costs:  
­ Direct   ­ Indirect  
 Analyze  by  year  

Not  Considered  
 Power    Cooling    OS  and  OS  Support  Costs    Facili>es    Down>me  costs      Professional  Services  

Acquire  (commodity  server)  
1) Size  the  Indexer(s)     --  Splunk  License  +  headroom     --  Use  Splunk  recommenda>ons  
2) Choose  a  Hardware  Vendor   3) Procurement   4) Maintenance  

Acquire  (commodity  server)  

1) Size  the  Indexer(s)     --  Splunk  License  +  headroom     --  Use  Splunk  recommenda>ons  
2) Choose  a  Hardware  Vendor   3) Procurement   4) Maintenance  

Indirect: Direct:   
  

  160  Hours     (2)  Servers  =  $16,000     Maintenance  Yearly  =  $4,000  

Deploy  (commodity  server)  
1) Rack   2) Network  and  Firewall   3) OS  Load   4) Security   5) Ops  Training  (SOP,  Recovery)   6) Storage   7) OS  Maintenance  (Patch,  Upgrade)  

Deploy  (commodity  server)  

1) Rack   2) Network  and  Firewall   3) OS  Load   4) Security   5) Ops  Training  (SOP,  Recovery)   6) Storage   7) OS  Maintenance  (Patch,  Upgrade)  

Indirect:   
Direct:   

  56  Hours  (Ini>al)     80  Hours  (Yearly)     18  TB  =  54,000  

Configure  (commodity  server)  
1) Tune  OS   2) Adjust  Security   3) Install  Splunk   4) Splunk  configura>on  
  --  Deployment  server     --  Replica>on     --  App  configura>on     

Configure  (commodity  server)  

1) Tune  OS  

2) Adjust  Security  

3) Install  Splunk  

4) Splunk  configura>on  

  --  Deployment  server  

  --  Replica>on  

  --  App  configura>on  

  

Indirect:

  240  Hours  (Ini>al)  

  

    

  

Total  Costs  

First  Year  

 Indirect  Costs:       536  Hrs  @  $50  =  

 Direct  Costs:     

  

  

Years  2  and  3  

    

 Indirect  Costs:   80  Hrs  @  $50  =  

 Direct  Costs:   

  

  $26,800     $30,800  
  $4,000     $4,000  

Yearly  Totals    Year  1:    Year  2:    Year  3:  

  $57,600     $    8,000     $    8,000  

Total  Cost:

  

  $73,600  

Alterna>ves  and  Impact  on  Model  
 Professional  Services    Cloud    Virtual      Hyper  Converged    Converged  

The  SBOX  Security  Appliance  
Powered  by  Splunk  
· Significant  Indirect  Cost  Reduc>on  (~20--30%)   · Pre--configured,  Pre--tuned   · Converged  Appliance   · Limited  IT  Ops  Required   · Disk  +  CPU  +  Splunk  
  

Any  Ques>ons?  

THANK  YOU  

