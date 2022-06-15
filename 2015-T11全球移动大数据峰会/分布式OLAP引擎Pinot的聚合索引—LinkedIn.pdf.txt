Pinot  
Real-time  Analytics  at  LinkedIn  
Greg  Brandt  (2015--09--11)  

A g e n d a   
· Pinot  at  LinkedIn   · Design  and  Architecture   · Segment  Layout   · StarTree  for  Fast  Aggregation   · ThirdEye  for  Business  Monitoring  

U s e    C a s e s    a t    L i n k e d I n  
· Who's  Viewed  My  Profile     ­ (member)  

U s e    C a s e s    a t    L i n k e d I n  
· XLNT     ­ A/B  tes-ng     ­ (internal)  

U s e    C a s e s    a t    L i n k e d I n  
· Ad  campaigns   ­ (customers)  

D a t a    A n a l y t i c s    E c o s y s t e m    a t    L i n k e d I n  

H i g h - L e v e l    D e s i g n  
Goals   · SQL-like  interface   · Columnar  storage  and  indexing   · Real-time  data  load   Non-goals   · JOIN,  UDF  (unpredictable  performance)   · Not  source  of  truth   · Mutability    
­ Immutability  allows  trivial  data  distribu-on  

P i n o t    A r c h i t e c t u r e  

S e g m e n t    A s s i g n m e n t  

A p a c h e    H e l i x  
· A  framework  for  building  distributed,  stateful   applications  
· Developed  at  LinkedIn  for  Espresso,   (distributed  OLTP  database)  
· Leveraged  in  Pinot  for  cluster  management   (Controller  uses  Helix  libraries)  
· http://helix.apache.org    

Quer y  Execution:  Distributed  

Quer y  Execution:  Loca l 
1. Parser   ­ SELECT  COUNT(*)  ...  =>  Abstract  Syntax  Tree  
2. Logical  Planner   ­ Operators  like  COUNT,  WHERE,  etc.  
3. Physical  Planner   ­ Consider  data  layout  (sort  key,  dic-onary   encoding,  compression,  etc.)  

L a y o u t :    C o l u m n a r    S t o r a g e  

Layout:  Sor ted  For ward  Index  

L a y o u t :    M o r e    O p t i o n s  
· Indexes   ­ Bitmap,     ­ Roaring  Bitmap,     ­ Inverted  
· Compression   ­ Dic-onary  encoding,     ­ P4Delta  
· Multi-value  columns  

L a y o u t :    S t a r Tr e e    I n d e x  
Based  on  "Iceberg-Cubes"  (Bottom-Up)  
Invariant:  scan  <=  k  records  to  answer  any   aggregation  query     

S t a r Tr e e    I n d e x    S t r u c t u r e  

S t a r Tr e e    C a s e    S t u d y  
· Consider  a  data  set  with  two  metrics  (clicks,   impressions),  and  four  dimensions  (country,  page,   user  segment,  time)  
· ~3B  raw  events  per  day   · 196  countries,  100  pages,  25  user  segments   · Store  documents  at  1  minute  granularity  
Let's  calculate  aggregate  time  series  for  one  week...  

S t a r Tr e e    C a s e    S t u d y  

SELECT SUM(clicks),SUM(impressions)

FROM table

WHERE time BETWEEN

StarTree  space  complexity  largely  impacted

2015-08-01 AND

  by  data  skew;  1.5  to  2  (mes  raw  data  size

2015-08-08

  in  pracHce  

GROUP BY (country, time)

Assuming  scan  speed  of  ~40M  documents  per  second  

Method   Ad--hoc  Pig  /  MR   Time  roll--up   Full  cubing   StarTree  (k  =  100)  

#  Docs  Scanned   21B   705M   Constant   28M  

Time  Complexity   8.75  minutes   2.04  minutes   Constant   0.7  seconds  

Space  Complexity   Constant   Constant   128.66  GB  /  week   O(leaves  *  k)  

B u i l d i n g    S t a r Tr e e    i n    P i n o t  
1. Take  highest  cardinality  dimension,  Dh   2. Compute  aggregates  after  removing  Dh   3. Append  aggregates  to  segment,  sort  on  Dh   4. For  each  value  of  Dh,  if  there  are  greater
  than  k  documents  in  sub-table,  repeat  on   sub-table   ­ Including  the  new  aggregate  value,  "*"  

B u i l d i n g    S t a r Tr e e    i n    P i n o t  
>> tree testTable_0_127_1/ testTable_0_127_1/ !"" D0.dict !"" D0.sv.unsorted.fwd !"" M0.dict !"" M0.sv.unsorted.fwd ... !"" creation.meta !"" daysSinceEpoch.dict !"" daysSinceEpoch.sv.unsorted.fwd !"" metadata.properties #"" startree
!"" D0.dict !"" D0.sv.unsorted.fwd !"" M0.dict !"" M0.sv.unsorted.fwd ... !"" daysSinceEpoch.dict !"" daysSinceEpoch.sv.unsorted.fwd !"" metadata.properties #"" startree.ser

The original Pinot segment, now partially sorted on dimension combination
The aggregate Pinot segment, containing partial aggregates (i.e. any StarTree prefix involving a "*" node)

StarTree  Summar y  
StarTree  speeds  up  Pinot  queries  two  ways...      1. Aggregation  queries  can  use  partial
  aggregates,  bound  scan  time  by  k  
2. Raw  segment  is  partially  sorted  by  StarTree   path  dimension  values,  improves  filter   queries  

B u s i n e s s    M o n i t o r i n g    a t    L i n k e d I n  
· Leverage  StarTree  to  to  monitor  highly-dimensional,   aggregate  time-series  business  metrics  in  real-time  
· Interactive  visualization  tools   ­ Drill--down,  guided  root--cause  analysis  
· Automated  anomaly  detection  algorithms   ­ Data--driven  OLAP  cube  explora-on   ­ Detect  spikes,  step--level  shi^s  

V i s u a l i z a t i o n :    H e a t    M a p  
· Used  in  financial  sector   · E.g.  Showing  y/3y  on
  2008-08-08,  for  S&P   500   · Click  on  cell  to  fix   ticker = `aig'  in   WHERE  clause,  drill   down  
Financial services like AIG and CitiGroup

A n o m a l y    D e t e c t i o n :    E x p l o r a t i o n  
· Explore  OLAP  cube  top-down  (start  at   overall  aggregate  metric)  
· Use  heuristic  (like  total  volume)  to  prune   search,  determine  dimension  exploration   order  
· Compute  GROUP  BY  (next_dimension,  time)   at  each  level,  and  run  anomaly  detection   algorithm  on  each  time  series  

A n o m a l y    D e t e c t i o n :    K a l m a n    F i l t e r i n g  
· Model  time  series   structural  components:     seasonality  +  trend  +   noise  
· Best  for  detecting   spikes/dips  
· Applied  in  Ads  metric   monitoring  

A n o m a l y    D e t e c t i o n :    S c a n    S t a t i s t i c s  
· Hypothesis  testing   to  determine   whether  the  pattern   within  time  series   interval  differs  from   the  rest  
· Best  for  detecting   step-level  changes  
Anomalies in Home Page download time, in India

Q u e s t i o n s ?  
gbrandt@linkedin.com    

