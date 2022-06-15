Copyright  ©  2015  Splunk  Inc.  
Splunk  ConfiguraAon   Management  and   Deployment  with  Ansible  
Jose  Hernandez  
Director  ­  Security  SoluAons,  Zenedge  
Sean  Delaney  
Client  Architect,  Splunk     

Intros  

Disclaimer  
During  the  course  of  this  presentaAon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauAon  you  that  such  statements  reflect  our   current  expectaAons  and  esAmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaAon  are  being  made  as  of  the  Ame  and  date  of  its  live   presentaAon.  If  reviewed  aUer  its  live  presentaAon,  this  presentaAon  may  not  contain  current  or   accurate  informaAon.  We  do  not  assume  any  obligaAon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiAon,  any  informaAon  about  our  roadmap  outlines  our  general  product  direcAon  and  is  subject  to   change  at  any  Ame  without  noAce.  It  is  for  informaAonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaAon  either  to  develop  the  features  
or  funcAonality  described  or  to  include  any  such  feature  or  funcAonality  in  a  future  release.  
3  

Agenda  
!  Deploying  Splunk  with  Ansible   ! Git  for  ConfiguraAon  Management   ! Git  for  ConfiguraAon  Monitoring   !  Demo   !  Take  Away     
4  

Deploying  Splunk   with  Ansible  

Deployment  Tools  

!  Why  use  a  deployment  tool?  

­ Automate  Deployment  (full  lifecycle)   ê Provision  systems  and  OperaAng  System   ê Create  users  and  the  applicaAon  
environment     ê Deploy/update  binaries  and  scripts   ê Deploy/update  configuraAon  files   ê Control  ­  start/stop/restart  services  

Many  choices:   · Ansible   · Puppet   · Chef   · CFEngine  
· Salt   · BladeLogic   · ......  

­ Deployment  Server?  

  

ê Only  deploys  Splunk  configuraAons  under  

$SPLUNK_HOME/etc/apps  

6  

Why  Ansible?  
!  No  Agent  Required   !  Uses  SSH  as  Transport   !  Easy  to  pickup   !  Low  overhead  and  scales  to  huge  deployments   !  Python  Base   !  Windows  deployments  via  Powershell  
7  

Ansible  Primer  
! Ansible--playbook:  Ansible  executable  which  runs  the  playbooks  etc..   !  Hosts:  INI  file  which  contains  the  role/group  and  host  mapping   !  Playbooks:  Ties  in  Roles,  host  groups  and  task  together  to  create  
orchestrated  acAons  on  target  hosts   !  Roles:  contains  the  acAons  each  group  will  complete  (this  is  where  
the  deployment  logic  lives)  
8  

Ansible  Structure  
9  

Running  Ansible  
Requirements:   ! Ansible  Installed   !  Splunk--admin  user  updated  with  your  keys  under  /playbooks/
splunk_creds/splunk--admin.pub   !  Root  password  of  hosts  to  run  Ansible  in   !  Make  sure  you  have  ssh  keys  generated  for  root   !  Hosts  inventory  updated  
10  

Running  Ansible,  cont...  
!  Before  running  Ansible  make  sure  that  your  environment  is  set   correctly.  Run:  
!  . /opt/ansible/hacking/env-setup!
!  To  build  a  splunk  server  from  scratch  just  run:  
!  ./ansible-playbook /etc/ansible/playbook/ search_heads.yml !
!  Make  sure  that  you  have  hosts  defined  under  hosts  
11  

Running  a  Playbook  
12  

Running  Searchhead  Playbook  
/etc/ansible#ansible-playbook playbooks/search_heads.yml! PLAY [apply common configuration to all nodes] ********************************! GATHERING FACTS ***************************************************************! ok: [162.243.231.42]! TASK: [common | install security controls] ************************************! ok: [162.243.231.42] => (item=chkrootkit,rkhunter,clamav,fail2ban)! TASK: [common | install basic utilities] **************************************! ok: [162.243.231.42] => (item=vim,screen,iotop,htop,ioping,ntp)! TASK: [common | create splunk-admin] ******************************************! ok: [162.243.231.42]! TASK: [common | copy splunk-admin bash_profile] *******************************! ok: [162.243.231.42] !
13  

Splunk  and  Git     
Part  1:  ConfiguraAon   Management  

DevOps  Approach  
!  Treat  ConfiguraAon  Files  as  code     and  test,  deploy  programmaAcally    
   !  Apply  QA/change  management  controls  
­ Gold  reference  copy   ­ Check--ins  and  diffs  (Who,  What,  When  changed)   ­ Combine  with  CM/TickeAng  System  (Who  and  Why)   ­ Easy  roll--back  to  known  good  state  
15  

ConfiguraAon  Deployment  

Git Repository

Source File Check-in

Scheduled Repository Check-out to Ansible source directory

16  

Deployer

Search Heads, Linux

Master Cluster Node

Indexers, Linux

Deployment Server

Forwarders, Windows

Forwarders, Linux

Git  Repository  Tree  
17  

Git:  Clone,  Sample  And  Create  Your  Own  Repository  
! git clone <repo> /etc/ansible! ! rm -rf .git! ! git init! ! git add *! ! git commit -m `my first commit'! ! git remote add origin <your new repo url>! ! git push -u origin masterFile check-in!
  
18  

Git:  Checking  Updated  Files  
! git status!
! git add modifiedfile.txt!
! git commit -m `add your commit message here'! ! git push origin master!
19  

Git:  Checkout  to  Ansible  Source  
!  On  the  Ansible  server  run  the  following  in  a  script  via  cron  
! git fetch --all! ! git reset --hard origin/master!
20  

Splunk  and  Git     
Part  2:  ConfiguraAon   Monitoring  

Problem:  Search  Load  Gone  Crazy?  
!  One  or  many  users  have  created  or  modified  a  dashboard  search  or   saved  scheduled  that  is  creaAng  excess  load  on  your  Splunk  servers  
!  How  do  you  find  which  search  is  the  culprit?  
22  

SoluAon:  Monitoring  Changes  to  Search  Configs  
!  On  search  heads  setup  a  cron  script  to  check--in  any  changes  Git  on   the  following  directories:  
!  $SPLUNK_HOME/etc/system! !  $SPLUNK_HOME/etc/apps!
!  $SPLUNK_HOME/etc/users   !  Use  a  scheduled  scripted  input  on  a  forwarder  to  collect  regular  file  
changes  and  index  the  changes  in  Splunk  
! git whatchanged!
!  Once  indexed  you  can  search  for  changes  over  a  Ame  window  
23  

Splunking  Searchhead  Config  Changes  

Search Head

Git Repository

Search Head
$SPLUNK_HOME/etc/system $SPLUNK_HOME/etc/apps $SPLUNK_HOME/etc/users

Forwarder

Indexers

SH/$SERVER_NAME/etc/system SH/$SERVER_NAME/etc/apps SH/$SERVER_NAMEetc/users
24  

Pupng  it  in  AcAon     
Demo  Time  

Take  Away  
!  AutomaAon  with  Ansible  takes  some  work  up   from,  but  will  will  make  life  simpler  in  the   long  run  
!  Using  Git  for  Splunk/Ansible  configuraAon   management  allows  for  change  management   and  simplified  roll  backs.  
!  Checking  in  Searchhead  configs  into  Splunk   provides  the  ability  to  detect  Admin  and  User   Search  changes    
26  

Resources  
!  Deploying  Splunk  Securely  with  Ansible   Config  Management  ­  Part  1  
! hqp://blogs.splunk.com/2014/07/12/ deploying--splunk--securely--with--ansible-- config--management--part--1/  
!  Deploying  Splunk  Securely  with  Ansible   Config  Management  ­  Part  2  
! hqp://blogs.splunk.com/2015/02/09/ deploying--splunk--securely--with--ansible-- config--management--part--2/  
  
27  

What  Now?    
Related  breakout  sessions  and  acAviAes...  
28  

THANK  YOU  

