Copyright  ©  2015  Splunk  Inc.  
Developing  at  the   Speed  of  Splunk  
Kurt  Chase  
Director  of  Release  Engineering,  Splunk  
Itay  Neeman  
Director  of  Engineering,  Splunk  

Disclaimer  
During  the  course  of  this  presentaEon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauEon  you  that  such  statements  reflect  our   current  expectaEons  and  esEmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaEon  are  being  made  as  of  the  Eme  and  date  of  its  live   presentaEon.  If  reviewed  aPer  its  live  presentaEon,  this  presentaEon  may  not  contain  current  or   accurate  informaEon.  We  do  not  assume  any  obligaEon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiEon,  any  informaEon  about  our  roadmap  outlines  our  general  product  direcEon  and  is  subject  to   change  at  any  Eme  without  noEce.  It  is  for  informaEonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaEon  either  to  develop  the  features  
or  funcEonality  described  or  to  include  any  such  feature  or  funcEonality  in  a  future  release.  
2  

IntroducEons  

Itay  Neeman  
Director  of  Engineering,  Data  Pla[orm     · Focus  on  backend  features,  e.g.:  
­ KV  Store   ­ HTTP  Event  Collector   ­ Distributed  Management  Console  
· Focus  on  Developer  Enablement,   e.g.:  
­ SDKs   ­ Tools  
· At  Splunk  for  4+  years  

Kurt  Chase  

Director  of  Release  Engineering  

·   

Global  Release  Engineering  and   Management:  

   ­ Infrastructure  
­ Builds   ­ Tools   ­ And  much  more!  

· At  Splunk  for  1  year  

3  

Agenda  
· Overview  of  Product  Development  @  Splunk   · A  "day"  in  the  life  of  a  feature   · How  we  use  Splunk  to  help  build  Splunk   · Discussion/Q&A     
4  

Products  @  Splunk  

Vancouver  

        

Seaile  

SF  Bay  Area  

6  

  
Shanghai  

Product  FuncEons  
· Product  Management  (PM)  ­  "What  should  we  build?"   · Quality  Assurance  (QA)  ­  "Does  it  work?"   · Development  (Dev)  ­  "How  do  we  build  it?"   · User  Experience  (UX)  ­  "How  to  make  it  usable?"   · Program  Management  (PMO)  ­  "Will  it  be  built  on  Eme?"   · Release  Management  (RE)  ­  "What  infra  do  we  need  to  build  it?"   · DocumentaEon  (Docs)  ­  "How  do  we  communicate  how  to  use  it?"   · Product  Security  (ProdSec)  ­  "Is  it  secure?"     
7  

MulEple  Products  
· Splunk  builds  mulEple  products:  
­ Splunk  Enterprise   ­ Hunk   ­ Splunk  Light   ­ Enterprise  Security   ­ IT  Service  Intelligence   ­ Splunk  Mobile  Access   ­ Cloud  
· Products  drive  and  influence  each  other  
­ ES  and  ITSI  drove  KV  Store  features  in  Enterprise   ­ Cloud  drove  installaEon  ease  of  ES  and  ITSI  
· Common  tooling  and  infrastructure  across  locaEons,  products  and  teams  
  
8  

Agile  
· Fully  funcEonal  scrum  teams   · Sprints  go  for  two  weeks   · ConEnuously  iterate  on  MVP     
9  

Best  of  Breed  Tools  
10  

A  "Day  in  the  Life"   of  a  Feature  

How  is  the  Salame  Made?  
12  

Glenn  Has  An  Idea!  
13  

IdeaEon  and  Discussion  
· Free--form  discussion  
­ HipChat   ­ Confluence   ­ MeeEngs  
· Culminates  in  a  Products  Requirement  Document  (PRD)  
­ Get  more  detailed  feedback  from  all  stakeholders     
  
14  

Planning  and  Design  
· Formulate  a  plan  
­ How  many  people  do  we  need  to  make  this  happen?   ­ How  long  is  it  going  to  take?  
· Engineers  start  working  on  Engineering  Requirements  Document  (ERD)   · QA  start  working  on  Test  Plan   · Convert  plan  (stories,  tasks,  tests)  to  JIRA     
15  

Execute  and  Iterate  
· Team  goes  into  execuEon  mode:  
­ Pick  a  task   ­ Write  code   ­ Write  tests   ­ Validate  
· Variety  of  tools:  
­ Source  Control  and  Code  Review:  Git/Stash   ­ ConEnuous  IntegraEon:  Jenkins  and  Bamboo   ­ TesEng:  internal  tools,  PyTest,  JUnit,  ApacheBench,  and  many  more  
  
16  

Git  and  Stash  
· Stash  is  our  Git  server  ­  main  home  of  our  codebase   · Each  task  is  a  branch,  correlated  with  JIRA  (e.g.  feature/SPL--12345)   · Before  merging  branch:  
­ Get  feedback  through  code  review   ­ Get  feedback  from  ConEnuous  IntegraEon   ­ Run  any  necessary  manual  validaEon  
· Hooked  into  all  our  reporEng  systems  
  
17  

ConEnuous  IntegraEon  
· Use  both  Bamboo  and  Jenkins   · Run  on  as  many  pla[orms  as  we  can  (Windows/Solaris/OS  X/Linux/etc)   · Various  kinds  of  triggers:  
­ Per--commit   ­ Per--Pull  Request   ­ Manual   ­ Nightly  
  
18  

Feedback  
· Once  iteraEon  nears  compleEon,  we  want  to  get  feedback   · We  work  with  targeted  customers:  
­ Setup  "advisory  board"   ­ Demo  feature  for  them   ­ Work  on  geung  a  test  deployment  where  it  makes  sense  
· Gather  feedback  and  conEnue  iteraEng   · ...  or  bring  back  into  future  ideaEon  
  
19  

Releasing  
· Merge  all  the  features  together  (from  all  the  feature  branches)   · We  then  make  sure:  
­ Everything  is  working  together  well   ­ Performance  is  up  to  our  expectaEons  
· Package  the  release  into  its  final  forms  (installers,  tarballs,  Cloud,  etc)   · Release  it  to  all  of  you!  
  
20  

Using  Splunk  to   Build  Splunk  

Splunk  @  Splunk  
· Splunk  is  used  extensively  all  throughout  our  process   · We  use  it  to:  
­ Report  holisEcally  on  our  release  and  JIRA   ­ Track  performance  measurements  across  releases  and  packages   ­ Do  performance  invesEgaEons   ­ Track  the  health  of  our  ConEnuous  IntegraEon  results   ­ Evaluate  Product  Security  vulnerabiliEes  and  status  
22  

Splunk  @  Splunk  Demos  

Summary  
· You've  seen  how  Splunk  does  engineering   · You've  seen  how  we  use  Splunk  to  build  a  beier  Splunk  for  you   · You've  seen  some  tools  that  you  can  use  to  help  your  product  
processes  
24  

THANK  YOU  

