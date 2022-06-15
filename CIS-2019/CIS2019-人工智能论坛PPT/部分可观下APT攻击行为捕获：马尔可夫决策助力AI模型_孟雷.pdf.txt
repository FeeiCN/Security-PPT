

APTAI





Agenda

APT AIAPT AI Data Exfiltration  

APT | 

 2009-2019
RSA 2011
APT1 2009-2019
 2015.12
APT 2012-2019

 2007-2011

 2009-2019

 2006-2010

Duqu 2007-2012

APT  

 2010-2012
 2010-2011
 2010-2011
 2014
TAO 1998-2013

Hangover 2010-2013
Darkhotel APT 2018-2019

 2012-2018



 2004-2013

Winnti 2009-2013

Safe 2012-2013

KBS 2003-2013
Hearbeat 2009-2012

 | Cyber Kill Chain and ATT&CK

Spear phishing

0-Day Exploits

Custom Malware

Malware Variants metamorphism & packer
Convert/Encrypted Tunnel

Social Engineering

 | 

 

· C&C  ·  · 



·  · Web · 

 
 
AI 

 | 


DGA DNS 
......


Webshell 
ICMP ......


 
 ......


/
Decision Tree Random forest logistics regression Isolation forest
k-means SVM

 | 

: 130
4 % 19 % 40 %

 

: 40%
40 %

  

APT 0day 

40%

 |  & 


 

 

 










 | 
DGA Webshell Mysql   DNS ICMP
AI


Observation

Reward

Action

{normalanomaly}

State : {blockingpassing}

{analyzeblockpass}



 | MC HMM MDP POMDP

With observation uncertainty, no decision

Markov Chain (MC)

Hidden Markov Model (HMM)

No observation uncertainty, with decision
Markov Decision Process
(MDP)

Partially Observable Markov Decision Process
(POMDP)
With both observation uncertainty and decision

ht(4-2)
 | POMDP

Transition Dynamics

Observation Reward

WORLD

Action

POMDP SATRZO MDP  
· SsS · AaA · TS×A(S)T(s, a, s')
sas'P(s'|s, a) · RS×ARR(s, a)sa
 · ZzZ · O S×A()O(s', a, z)a
s'zP(z |s', a)

SE

b Policy 

Agent

Agentb, b0
( = Pr( = |, -1, -1, . . . 0, 0
( = {(0, (1, (2, . . . , (, (

P(z | b, a( )) = b(s)b(s)T (s ', s, a( ))O(z, a( ), s ')

sS

s 'S

 | POMDPAPT


( = (, ( +  (|, (((



(, ( = ((, (


(|, ( =  ( ((, , ( (, (, 





POMDP* b 

+1(  +1(

POMDP

+(

=




 ((,  +    ( ((, , (, , (



 



POMCP | 

Selection

Expansion

Simulation

Backpropagation

Tree Policy

Default Policy

APT | AI --> AI



  

C&C  

 


 







AI



Webshell 

 

C&C

DGA

C2 



 

UEBA



 

 



 

POMDPAI

World
SATRZO



  /

 





Agent


Data Exfiltration 



2019 

First American Corporation Facebook Truecaller Zynga Canva
Capital One Justdial
Mobile TeleSystems (MTS) Quest Diagnostics Adobe Inc. StockX
2019 Bulgarian revenue agency hack DoorDash Desjardins
Universiti Teknologi MARA Health Sciences Authority (Singapore)
Westpac Ministry of Health (Singapore)
0

200000000

400000000

600000000

800000000

  UnderArmour
Aadhaar MyHeritage
Facebook Panera
Ticketfly Sacramento Bee
AcFun 0

2018 

200000000

400000000

600000000

800000000

1E+09

 | 





Data Exfiltration | Hidden Tunnel

Command and Control External Remote Access Hidden DNS Tunnel Hidden HTTP/S Tunnel Suspicious Relay Suspect Domain Activity Malware Update Peer-to-Peer Pulling Instructions Suspicious HTTP Stealth HTTP Post TOR Activity Threat Intel Match

Reconnaissance Internal Darknet Scan Port Scan Port Sweep SMB Account Scan Kerberos Account Scan File Share Enum Suspicious LDAP Query RDP Recon RPC Recon

Lateral Movement Suspicious Remote Exec Suspicious Remote Desktop Suspicious Admin Shell Knocker Automated Replication Brute-Force Attack SMB Brute-Force Kerberos Brute Force Suspicious Kerberos Client Suspicious Kerberos Account Kerberos Server Activity Ransomware File Activity SQL Injection Activity

Exfiltration Data Smuggler Smash and Grab Hidden DNS Tunnel Hidden HTTP/S Tunnel
Botnet Monetization Abnomal Web or Ad Activity Cryptocurrency Mining Brute-Foce Attack Outbound DoS Outbound Port Sweep Outbound Spam

AI | DNS

DNS

 DNS316268 320677 >95%
  

 0ufb582¾xgcxıaabacuqa4xzÒabagdvó¿asfsicŞykîa wrĞfßêÚÀxçŞdahixça.aaqigu×mÒdëàecfÌÉrupÁÔÊ ÇciÕkhÏnyryÔfğÅ7dëlÃÄk6pvcÇlqvïdzh.2hÕsĞíøëe mßét÷üÙëÅaah3å÷àw÷ß2ròa.log.riskivy.info

AI | HTTPS
 conn.logssl.logx509.log  SrcIPDstIPDstPort  SSLSSL  sslConnection .log  28SSL...

POMDP |  Data Exfiltration 

Data Exfiltration POMPDSATZO RSATZOR
 

S = {Sblocking, Spassing}
 



A = {Aanalyze, Ablock, Apass}

AI

 

Z = {Zregular, Ztunnel}



POMDP |  Data Exfiltration 

Data Exfiltration POMPDSATZO RSATZOR

 

T(s,a)=

1 ,   ,  = 

1, ||

  ,  = 

1 || ,   ,  = 

a s'

 

(|,  =

,  = | = sin =  1 - ,  = | = passing = 
,  = | =  =  1 - ,  = | =  = 
1 || , 

sa z
QAI

POMDP |  Data Exfiltration 

Data Exfiltration POMPDSATZO RSATZOR

 

(,  =

,  = passing,  = 
,  = ,  =  1 - ,  = ,  = 
 - 1,  = passing,  = 
  ,   ,  = 

sa 
LC 

 



POMCP

DNS
POMDP

 | 



 MLDNSQ=0.95

 C=1.28

Ablock Apass - 0.5

Aanalyze-1.0

Sblocking:
Zregular-0.05, Ztunnel-0.95

Spassing:
Zregular-0.95, Ztunnel-0.05

Aanalyze-1.0

Ablock Apass - 0.5

 | DNS
iodinedns2tcpdnscat2ozymandns


MLAPT  +  




