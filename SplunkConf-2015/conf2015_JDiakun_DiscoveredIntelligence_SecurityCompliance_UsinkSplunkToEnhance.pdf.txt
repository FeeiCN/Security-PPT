Using  Splunk  to  Enhance,  and  Prove,   Your  Security  Awareness  Programs
  

About Josh
u    Canadian   u    Managing  Partner  at  Discovered  Intelligence   u    Using  Splunk  6+  years  ­  5  years  as  a  customer   u    Co--Author  of  "Splunk  OperaEonal  Intelligence  Cookbook"   u    IT  and  Security  Ops  background  

What This Talk Is
   u    Security  Awareness  Challenges  
u    IntersecEon  of  Data  and  Awareness  
u    Harnessing  Data  to  Build  Awareness  
u    Data--driven  Value  Measurement  

Security Awareness Is Boring
u Dull  topics   u Generally  dull  delivery      u Hard  to  relate   u Hit  &  Run  

"Really?!  More  training?!!"                   --  Everyone  

But Security Awareness Is Important...

Mar  17,  2015  ­  11.2M   records  (names,  addresses,   DOB,  SSNs,  bank  info  &   more)  

June  2015  ­  21.5M   records  (names,   addresses,  SSNs,   fingerprints  &  more)  

May  20,  2015  --  1.1M   records  (names,  DOB,   emails  &  subscriber  info)  

July  19,  2015  ­  32M  records  (names,  addresses   &  more)  +  12.7GB  of  corporate  emails  

What We Know About Behavior
u    Personal  messages  are  most  effecEve   u    People  place  undue  weight  on  recency   u    Are  most  drawn  to  relevant  material   u    People  are  most  influenced  by  others  like  them   u    (most)  Want  to  do  the  right  thing  

Incorporate Data Into Awareness Campaigns
u    Ensure  materials  inclusive  of  most--recent,  relatable,  data      u    Use  public  dashboards  (think,  extranet)  that  relate  current  state  
to  awareness  topics  
u    Provide  a  level  of  threat  intelligence  they  can  relate  to  and  that   can  become  immediately  acEonable  
u    Creates  a  culture  of  conEnuous  awareness  

Illustrate The Risk Landscape

Targeted Training Means Relatable Data
u Focused   u Relatable  Metrics   u Drive  compeEEve  
nature   u Make  an  impact   u Measure  data  
against  dollars  

Highlight Employee ContribuHons

Automate "friendly reminders"
u    Periodic  scheduled  searches  for  high--risk  policy  violaEons      u    Define  acceptable  threshold  for  policy  violaEons  in  a  given  window  
u    When  threshold  is  breached  automate  a  friendly  reminder  on  the  policy   along  with  some  helpful  informaEon  
u    Splunk  command  for  dynamic  email  generaEon  to  mulEple  recipients:     sendresults  --  hdps://splunkbase.splunk.com/app/1794/  

How Do We Measure...

TradiHonal Methods for Measuring EffecHveness
u    Who  completed  the  training      u    Scored  based  on  CBT  or  quizzes  

u    Feedback  from  survey's  

u    Observing  physical  behavior  

  

  

...All  of  this  is  good,  but  what  does  it  provide?  

...A Good Measurement of Someone's Mood

Data--driven Measurements of EffecHveness
u    Surprise  #1...  everything  we  do  produces  data  (wow!)   u    Surprise  #2...  that  data  is  most  likely  in  Splunk!   u    Take  your  policies  and  map  it  to  the  data  (QuanEfiable  metrics!)   u    Ability  to  produce  conEnuous  measurements   u    Learn  about  behaviors,  not  moods!   u    When  educaEng,  use  tools  that  produce  a  digital  footprint  

Policy to Data Examples!
u     Users  not  updaEng/patching  their  devices  
tag=update  status=installed  |  stats  min(_Eme)  AS  install_Eme  by  dest,  signature_id  |  stats  max(install_Eme)  AS  install_Eme  by  dest  |  eval  days_ago=round((Eme()-- install_Eme)/86400,2)  |  search  days_ago>15  |  fields  ­  install_Eme  
u     Unapproved  cloud  applicaEon  usage  
tag=proxy  OR  tag=dns  NOT  tag=internal_dest  |  lookup  cloud_domains.csv  dest  OUTPUT  is_permided  |  search  is_permided=false  |  stats  count  by  src,user,dest  
u     Usage  of  untrusted/unapproved  applicaEons  
tag=process  OR  tag=service  |  lookup  untrusted_applicaEons.csv  process  service  OUTPUT  is_permided  |  search  is_permided=false  |  eval   applicaEon=if(isnotnull(process),process,service)  |  stats  count  by  dest,user,applicaEon  
u     Transmission  of  sensiEve  materials  externally  
tag=email  NOT  tag=corporate_domain  |  lookup  risky_file_names.csv  file_name  OUTPUT  is_permided  |  search  is_permided=false  |  stats  count  by   file_name,src_user,recipient  
u     VulnerabiliEes  are  patched  within  reasonable  Eme  
tag=vulnerability  |  stats  min(_Eme)  AS  first_seen  max(_Eme)  AS  last_seen  by  dest,  signature  |  where  first_seen!=last_seen  |  eval  days_vuln=(last_seen--first_seen)/ 86400  |  stats  avg(days_vuln)  as  avg_days_vuln  
u     Accessing  inappropriate  content  
tag=proxy  |  lookup  proxy_categories.csv  category  OUTPUT  is_permided  |  search  is_permided=false  |  stats  count  by  src,user,category  
u     Must  use  badge  when  entering  or  exiEng  office  
tag=badge  badge_event="entry"  earliest=@d  latest=now  |  append  [  search  tag=badge  badge_event="exit"  earliest=@d  latest=now  |  stats  count  AS  badge_exits  by   user  ]  |  stats  count  AS  badge_entries,  values(badge_exits)  AS  badge_exits  by  user  |  eval  comment=case(badge_entries>badge_exits,"TailgaEng   OUT",badge_exits>badge_entries,"TailgaEng  IN",1=1,"Perfect!  Commend  this  employee!")  |  table  user,  comment  

Measure to Prove AND Improve
u    Observe  and  compare  before/axer  awareness  campaigns   u    Refine  the  scoring  system  for  policy  violaEons   u    Use  results  to  drive  focused  awareness  campaigns   u    Construct  meaningful  KPIs  for  management  

Thank  You!  

