Balancing the Pwn Trade Deficit Series: APT Secrets in Asia
{Anthony Lai,Benson Wu,Jeremy Chiu} Xecure Founder and Researcher
PK, Security Researcher
6/25/11

There is no national secret here  We welcome spies and SS here. Spies/SS are human, too :)
6/25/11

Why we are here again
 Last  year,  Val  Smith,  Colin  Ames  and  I  (Anthony)  have   worked  together  on  analyzing  China--made  malware,   making  first  east--meets--west  research  and  studies.  We   conCnue  this  effort.  
 This  year,  we  have  dealt  with  many  targeted  aFack  cases,   we  would  like  to  share  the  case  studies  with  you  and  the   correlaCon  analysis  with  my  Taiwanese  research  fellows.  
 We  are  happy  about  this  presentaCon  is  accepted  in  first-- round  selecCon  of  DEFCON  19,  however,  it  is  rejected  in   Blackhat  with  reviewer  comment:  "  We  are  curious  about   your  automated  analysis."  --  Thank  you  for  their   comment  ;--)  
6/25/11

Who we are?
 Anthony  Lai  (a.k.a  Darkfloyd)  
 He  works  on  code  audit,  penetraCon  test,  crime   invesCgaCon  and  threat  analysis  and  acted  as  security   consultant  in  various  MNCs.  His  interest  falls  on   studying  exploit,  reverse  engineering,  analyse  threat   and  join  CTFs,  it  would  be  nice  to  keep  going  and   boost  this  China--made  security  wind  in  malware   analysis  and  advanced  persistent  threat  areas.  
 He  found  security  research  group  called  VXRL  in  Hong   Kong  and  has  been  working  as  visiCng  lecturer  in  HK   Polytechnic  University  on  hacking  course  :)  
 Spoken  at  Blackhat  USA  2010,  DEFCON  18  and  Hack  In   Taiwan  2010/2011  
6/25/11

 Benson Wu
 He currently works as Postdoctoral Researcher from Research Center for Information Technology Innovation at Academia Sinica in Taiwan.
 He focuses research on malware and threat analysis, code review, secure coding and SDLC process implementation. He graduated from National Taiwan University with PhD degree in Electrical Engineering. He had spoken at NIST SATE 2009, DEFCON 18 (with Birdman), OWASP China 2010, and wrote the "Web Application Security Guideline" for the Taiwan government.
6/25/11

 Jeremy Chiu (a.k.a Birdman)
 He has more than ten years of experience with hostbased security, focusing on kernel technologies for both the Win32 and Linux platforms. In early 2001 he was created Taiwan's first widespread trojan BirdSPY. The court dropped charges after Jeremy committed to allocate part of his future time to assist Taiwan law enforcement in digital forensics and incidence response.
 Jeremy specializes in rootkit/backdoor design. Jeremy also specializes in reverse engineering and malware analysis, and has been contracted by law enforcements to assist in forensics operations. Jeremy is a sought-after speaker for topics related to security, kernel programming, and object-oriented design
6/25/11

 PK
 Peikan (aka PK) has intensive computer forensic, malware and exploit analysis and reverse engineering experience. He has been the speaker in Syscan and HIT (Hack In Taiwan) and convey various training and workshop for practitioners.
6/25/11

Agenda
 APT  Vs  Malware    Case  Studies    Research  Methodology    Clustering  Analysis  and  Results  
6/25/11

Abstract
· APT (Advanced Persistent Threat) means any targeted attacks against any specific company/organization from an or/and a group of organized attack party(ies).
· Other than providing the case studies, we would like to present and analyze APT from the malicious email document, throughout our automated analysis, we could identify and cluster the correlation among the samples featured with various exploit, malware and Botnet .
6/25/2011

Major APT Activity: Targeted-Attack Email
· We have observed there are three major types of Targeted-Attack Email
1.Phishing mail: Steal user ID and password 2.Malicious script: Detect end-use computing
environment 3.Install and deploy Malware (Botnet) !

6/25/2011

APT Mail = Document Exploit + Malware

APT Attack Vs Traditional Botnet Activities

APT Botnet Activities

Traditional Botnet Activities

Distribution

With organized planning

Mass distribution over regions

Cause damage? Targeted or not? Target Audience Attack Effective Duration Frequency of attacks
Weapon

No

No

Targeted (only a few groups/organizationsN)ot targeted (large area spreadout)

Particular organization/company Long duration

Individual credentials including online banking account information Relative Short

Many times

Once or twice

· 0-day Exploit · Drop Embedded Malware

· Use existent multiple exploits · URL Download Malware

AV Detection Rate Detection rate is lower than 10% if the Detection rate is around 95% if the sample comes out within one month sample comes out within one month

6/25/2011
Remarks: IPS, IDS and Firewall cannot help and detect in this area

Part 1: Case Studies: Against a Political Party in Hong Kong
6/25/11

Case 1: Calling from Mr. X
· Mr. X is a one of the key persons of political party in Hong Kong.  
· He dropped us an email as he feels suspicious on an attachment called meeting.zip and it contains two files, agenda.doc and minutes.doc  
· It looks like a member meeting agenda.   · The email targets all committee members in his
organization. · Mr. X said he always got this kind of mails
before 4 June, 1 July and election.
6/25/11

Analysis
· Running analysis in our Xecure analyzer engine   · Basically, it is not a fake.doc but a PE file and
minutes.doc is a document shortcut .lnk file which triggers to execute agenda.doc
6/25/11

Xecure Analyzer Engine

Analysis - CnC location
· Connect to remote IP address in Hong Kong at 8080 port.
· It is still alive 
6/25/11

Analysis ­ CaptureBAT
Recorded in chronological order  
C:\Documents and Settings\Administrator\Local Settings\Application
Data\ws2help.PNF was added by "Agenda.doc"  
C:\Documents and Settings\Administrator\Local Settings\Application
Data\msvcr.dll was added by "Agenda.doc"  
C:\WINDOWS\system32\netstat.exe was [written/accessed] by
"Agenda.doc"   C:\WINDOWS\inf\1.txt was deleted by "Agenda.doc"   C:\WINDOWS\system32\netstat.exe was modified by "Agenda.doc"  
6/25/11

C:\Documents and Settings\Administrator\Local Settings\Application
Data\IECheck.exe was added by "Agenda.doc"   C:\WINDOWS\system32\ipsecstap.dat was added by "explorer.exe"  
C:\Documents and Settings\Administrator\Start Menu\Programs \Startup\Internet Explorer Security Check.lnk was added by "explorer.exe"
6/25/11

Analysis - Regshot
Files added   C:\Documents and Settings\Administrator\Local Settings \Application Data\IECheck.exe   C:\Documents and Settings\Administrator\Local Settings \Application Data\msvcr.dll   C:\Documents and Settings\Administrator\Local Settings \Application Data\ws2help.PNF   C:\Documents and Settings\Administrator\My Documents \My Pictures\_@D.tmp   C:\Documents and Settings\Administrator\Start Menu \Programs\Startup\Internet Explorer Security Check.lnk   C:\WINDOWS\system32\2525   C:\WINDOWS\system32\ipsecstap.dat   Files deleted   C:\Documents and Settings\Administrator\Desktop \D6/2e5/1m1 ocracy Depot meeting\Sample\Agenda.doc

Analysis - Target popular IM and emails

Analysis - Injection to explorer.exe

Infection Path
· Agenda.doc (Dropper)  
o Create IECheck.exe   o Copy WS2Help.PNF to application data folder.   o Change netstat.exe   o Inject code to msvcr.dll and then to explorer.exe   o Creat mutux (VistaDLL Running)   o Detect anti-virus program including Kapersky  
o Target QQ, MSN, sina, foxmail and hotmail
6/25/11

Analysis - Encoding Scheme
· XOR encoding only  
· Encode and decode the traffic

Analysis ­ Encoding Scheme
6/25/11

Analysis ­ Encoding Scheme
6/25/11

Analysis ­ Encoding Scheme
6/25/11

Analysis ­ Encoding Scheme
6/25/11

Analysis ­ Encoding Scheme
6/25/11

Analysis ­ Encoding Scheme
6/25/11

Analysis ­ Encoding Scheme
6/25/11

Analysis ­ Encoding Scheme
6/25/11

Analysis ­ What information has been sent to CnC server?
· After decoding the network traffic  
o The host name   o Installed OS type and patch level   · There should be more information sent to CnC server :)
6/25/11

Analysis ­ Found the .cab file
· We have found .bmp file in a compressed .cab file under application folder  
· Screenshots are found. What the fxxk that our Wireshark screenshot is captured and sent back to CnC server :)
6/25/11

Digging into Tiger's Mouth 
· We have tried to install QQ, MSN and see what's going on:   o Binaries are downloaded to the victim in C: \Windows\Debug folder   o Malware creates more files in C:\Windows \Debug\Data folder   o Those files are removed shortly.   o Collected information are saved as file with .dll as extension and send it back to CnC server
6/25/11

What's going on?
· We  have  found  that  CnC  server  sent  an  instrucCon  to  the  vicCm   machine  to  compress  files  and  send  them  back  to  the  CnC  server.    
· There  is  a  traffic  sequence  number  set  by  the  CnC  server.  Once  the   sequence  number  is  used  or  wrong,  the  machine  will  not  be   infected  again  or  CnC  server  will  not  send  further  instrucCon..  
· The  files  iestorage.dll,  SAM.dll  and  system.dll  are  actually  cab   compressed.  Just  rename  the  extension  as  "cab"  and  decompress  
them  to  get  the  following  informaCon.  
o The  SAM  and  system  kept  the  vicCm  machines  account   informaCon  and  registry  informaCon.  
· The  iestorage  contains  a  file  called  ".txt987654321"  which  
keeps  the  hacked  email  accounts  and  passwords.  
· Another  file,  called  drive,  it  keeps  all  filenames  and  Cme  
informaCon  on  the  hard  disk  
o The  APT  task  force  really  wants  to  know  what  informaCon  that   the  target  kept  in  the  vicCm  machine.  
6/25/11

· Carrying out the dynamic analysis
o The  injected  explorer.exe  downloads  fvcwin32.exe,   acvcwin32.exe  and  avcwin32.exe  and  kick  started  these   programs.  
o fvcwin32.exe  is  responsible  to  collect  all  hard  disk  file   informaCon  and  create  the  file  "drive"  under  C:\windows \debug  
o avcwin32.exe  is  responsible  to  collect  email  accounts  and   passwords,  SAM,  system  info,  keeping  them  under  a  %AppData %\temp.  They  are  removed  immediately  amer  amer  compressed   and  saved  under  C:\windows\debug\data\.  In  addiCon,  it  keeps   capturing  screen  for  every  1000  ms  and  saves  the  image  under   C:\windows\debug\data  folder  
o acvwin32.exe  is  to  capture  screenshots  for  every  1000ms  
o The  injected  "msrvc.dll"  keep  on  monitoring  the  c:\windows \debug\data  folder  and  send  out  any  new  files  under  the   folder  to  CnC  server,  immediately  deleCng  sent  files.  
6/25/11

Case Summary (1)
· Target political party in Hong Kong · CnC server is in Hong Kong.   · The origin is from our mother country, China.   · This "China-made" APT is NAPT (Non-
Advanced Persistent Threat) as we found some old routines for Win95/98. The "programmer" adds new features to it indeed and even use the same dropper in a separated collected .xls sample.  
6/25/11

Case Summary (2)
· The agenda.doc is just packed with UPX. · Dumping user credentials · Using XOR instead of complicated encryption
routine to encode/decode traffic to prevent from IPS/IDS detection.   · Download payload in different stages and each payload/executable is responsible for a single action. · Use/Dependent on built-in Windows libraries · With proper sequence number set up by CnC server to manage the victim,
6/25/11

Case Summary (3)
· Same  Generator  --  The  disassembled  structure  in   agenda.doc  matches  the  one  in  different  APT  sample   (.exe)  zipped  inside  a  .chm  file  

Case Summary (4)
· This detailed case analysis is supplementary to reports published from:
· Tracking Ghostnet http://www.infowar-monitor.net/2009/09/trackingghostnet-investigating-a-cyber-espionage-network/
· Madiant http://www.princeton.edu/~yctwo/files/readings/MTrends.pdf
· Feel free to reach me for the sample if you like.
· Meanwhile, do we still need to bother to do same analysis for various samples if they may come from the APT generator/taskforce? It drives our research indeed.  

Case 2: Calling from Mr. X Again
· Mr.  X  get  many  mails  with  suspicious  aFachment   on  or  before  4  June,  1  July  and  LEGCO  elecCon   and  conCnue  to  make  enquiry  from  me.  
· The  sender  seems  to  be  a  staff  in  LEGCO  council   · AnC--virus  engine  engaged  by  Gmail  has  not  
detected  any  issues.   · Filename  wriFen  in  Chinese  is  about  "Official  
Reporters'  List  for  LEGCO  Council  News"  

Hong Kong APT: Open it, man!

 Justice
http://en.wikipedia.org/wiki/Guan_Yu

"All that is necessary for the triumph of evil is that good men do nothing" ­
Edmund Burkle

Let me take shout: "Grass Root Horse"! ""!

Automated Clustering: It is from Group-C

Malware of APT Group C

Malware Attack Graph

Malware Fix Suggestion

C&C Location of APT Group C

A Chinese Poem from Cao Zhi (-)
·    · Cooking beans on a fire kindled with bean
stalks,   ·    · The beans weep in the pot.   ·    · Originally born from the selfsame roots,   ·    · Why so eager to torture each other!
6/25/11

Special Thanks
· Special thanks to Ran2 and DDL to analyze those APT samples with me. · Especially Ran2 has worked on the analysis with me and got a lot juicy stuff from time to time 

Part 2: Research Methodology
6/25/11

Research Direction (1/2)
· We  are  not  just  focusing  on  a  single  one--off   aFack,  we  tend  to  observe  the  enIre  APT  aFack   plan  and  trend  
­ TradiConally,  we  just  focus  on  malware  forensics  or   analyze  a  single  vicCm's  machine.  We  cannot   understand  the  APT  aFack  plan  and  its  trend  indeed.  

Research Direction (2/2)
· Analyze  and  extract  features  and   characterisIcs  of  APT  taskforce  via:  
­ Malware  features   ­ Exploit   ­ C&C  Network   ­ Speared  Email   ­ VicCm's  background   ­ Time  of  aFack

APT File Analysis and Grouping
 TheoreCcally,  in  an  informaCon  system  (i.e.  malware  analysis   system),  if  we  could  collect  all  the  aFributes/properCes  of  our   malicious  sample  sets,  we  could  idenCfy  whether  the  executable/ document/sample  is  malicious.  
 However,  the  research  issues  are  insufficient  collecCon  in  aFributes/ characterisCcs  (for  example,  the  malware  has  been  packed  and   engage  various  anC--debugging  capabiliCes),  so  that  we  get  the  
indiscernibility  relaCon  

Standard Analysis Method

 StaCc  Approach  
 Extract  signature/features  from  file  format  
 Reversing  

 Dynamic  Approach  
 Execute  it  under  controlled  environment  and  capture/log   all  the  behaviors  
 Analyze  networking  traffic  

· Challenge  of  Dynamic  Analysis

EncrypIon,   ObfuscaIon

AnI--VM/ Sandbox

Dormant   FuncIonality

Side--Effect  of  
Master/Bot   interacIon

We prefer using static analysis to prevent from Anti-VM, dormant functionality and side effect of master/bot interaction.

What APT Attributes we focused?
· We  work  on  the  analysis  on  mulC--vector  basis.  
· Throughout  staCc  analysis:  
­ Extract  and  review  executable,  Shellcode  and  PE  header   ­ Objects  and  abnormal  structure  in  file  
· Throughout  dynamic  analysis:  
­ Install  the  system  into  Windows  
· Scan  Process  Memory  to  detect  abnormal  structure   · Code--InjecCon,  API  Hooking  ...  
­ Detect  any  known  Code  Snippet  
· Rootkit,  KeyLogger,  Password  Collector,  AnC--AV...    
­ Suspicious  strings:  email  address,  domain,  IP,  URL

Extract Attributes from APT File

Static Analysis
Dynamic Analysis

CVE

CVE-2009-3129

Shellcode

Code=90903CFDEF CAPO=E2FE9071 PUCA=002191CB

Entropy 6.821483

Network

140.128.115.*** smtp.126.com test.3322.org.cn

Structure Malware 1

JS=A103FE426E214CE JS=90C0C0C0C AS=32EF90183227
PE=EF024788 Entry=000B7324 Code=D7B5A0120987FE Code=83D2325AB5 Code=20BDCE Autorun=STARTUP_FOLDER Behavior=DLL-Injection, Password Collector

DiscreIzaIon

Malware 2

PE=EF93461A Entry=0003CAC0 Code=AC23109B Code=19EFAC21 Behavior=API-Hooking

Clustering !

Xecure Engine

Exploit Concept
Exploit CVE Shellcode
Malware Concept
PE Information Code Snippet
Behavior
Network Concept
C&C IP/Domain

SC.5D5819EE SC.D810C601 PE.EBD5880B PE.5A05A491 CD.FC7939E2 CD.102C752B CD.2AFB773A ML.47E1B4C6 Clustering NT.549535DD CC.656C20E1 CC.77DEB444 ......

Protocol

Extract Fingerprints Save to DB

Part 3: Analysis and Result
6/25/11

Experiment
 Mila's  provided  APT  sample   archives  are  confirmed  to   malicious    
 Those  archives  are  open  to  public   for  downloading  and  analysis   (CollecCon1,  242  APT  files)  
 The  sample  archives  are  used  by   many  researchers  
 We  highly  credit  to  Mila's  samples  
 hFp://contagiodump.blogspot.com/  

Detection Rate
Xecure  Inspector  
 94.6  %  (229  /  242  )  
DefiniCon  updated  to  2011/6/11  
MicrosoX  Security  EssenIals  
 21.4  %  (52  /  242)  
Sophos  
 35.9  %  (87/242)  
AnIVir  
 56.6  %  (137/242)

There are 8 major APT-Taskforce Groups

Group D Group F
Group A Group G

Group B Group H
Group C Group E

Groups of Mila Sample Set Collection1

2011 2010 2009 2008 other

Top 3 APT Taskforce Groups

Active 2009-0923 ~ 2011-0420

Number CVE Malware C&C

40
CVE-2009-4841, CVE-2009-0927, CVE-2009-3129, CVE-2009-4324, CVE-2010-0188, CVE-2010-2833, CVE-2011-0611, CVE-2011-0609
APT00010
IP:23, Domain: 5

Active Number
CVE
Malware C&C

2008-0414 ~ 2011-0211
26
CVE-2006-6456, CVE-2008-0081, CVE-2009-1129, CVE-2009-4324, CVE-2010-0188, CVE-2010-2883, CVE-2010-3333
APT000A0
IP:23, Domain:4

Active  Number
CVE
Malware C&C

2008-0904 ~ 2011-0413
21
CVE-2007-5659, CVE-2008-4841, CVE-2009-1862, CVE-2009-3129, CVE-2009-4324, CVE-2009-0658, CVE-2009-0927, 
APT00200
IP:5, Domain:11

Malware of APT Group A

Malware Attack Graph

Malware Fix Suggestion

C&C Location of APT Group A
48.1%  C&C  IP  located  in   Taiwan

Malware of APT Group B

Malware Attack Graph

Malware Fix Suggestion

C&C Location of APT Group B
16%  C&C  IP  located  in   Taiwan

Malware of Group E
Group--E   Language  =  Korean    

All (A,B,C)

Findings from Mila Sample Set (1/2)

Findings from Mila Sample Set (2/2)

 APT--Deezer    provides  a  free  online   service  to  check  whether  your   submiFed  sample  whether  it  is  an  APT   sample  
 We  tak  Mila  sample  set  as  the  base  training   set  
 IdenCfy  Exploit  CVE  and  Malware  family    Zero--Day  Exploit  detecCon  and  analysis    APT  Malware  sample  DNA  analysis  and  
comparison    APT  sample  clustering  and  grouping    Support  file  formats  including  
DOC,PPT,XLS,PDF,RTF  
 URL:  hFp://aptdeezer.xecure--lab.com

Case Study (1/3) Target Attack Mail has been signed !?
COMODO !

(2/3) Identify the APT Taskforce Group

(3/3) Identify the APT Taskforce Group
· But  Malware  is  a  known  family,  it  is  same  as   APT--Group--B  !

Thank you for your listening
· Xecure Lab (http://www.xecure-lab.com) · We keep collecting samples for analysis. · Enhance the capability to analyze and observe APT
DNA family in more accurate manner. · It is an incremental efforts made to the Malware
Analysis community. · Together, we make homeland secured.

Special Thanks
· Every members in Xecure Research Team and Mila as well as everyone has contributed ideas to us.
· Our family and fellows

Finally

Blackhat review board members, are you convinced yet? 

