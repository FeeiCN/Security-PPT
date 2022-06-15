macOSEDR

 @fei_cong


   EDR  EDR  macOS  macOSAgent  



EDR
     EDR  EDR



 ATP(Advanced Threat Protection)

 NIDS(Network Intrusion Detection System)

 CWPP(Cloud Workload Protection Platforms)

 NGAV(Next-Generation AntiVirus)

 DLP(Data Loss Prevention)

 NGAF(Next-Generation Application Firewall)

 ETDR(Endpoint Threat Detection and Response)  NGFW(Next-Generation FireWall)

 EPP(Endpoint Protection Platform)

 NGSOC(Next-Generation Security Operation Center)

 EDR(Endpoint Detection and Response)

 WAF(Web Application Firewall)

 HIDS(Host-based Intrusion Detection System)

 SSP(Safety Sensing Platform)

 NIPS(Network-based Intrusion Prevention System)  SIEM(Security Information and Event Management)

-

Detection
SSP DLP HIDS NIDS Prediction
SA(Situational Awareness) TIP(Threat Intelligence Platform)

Protection
ATP HIPS NIPS WAF NGAV NGAF NGFW Response
SOC SIEM

EDR
Gartner's Anton Chuvakin first coined the term Endpoint Threat Detection and Response (ETDR) in July 2013 to define "the tools primarily focused on detecting and investigating suspicious activities (and traces of such) other problems on hosts/endpoints." Commonly referred to as Endpoint Detection and Response (EDR), it is a relatively new category of solutions that is sometimes compared to Advanced Threat Protection (ATP) in terms of overall security capabilities.
Endpoint detection and response is an emerging technology that addresses the need for continuous monitoring and response to advanced threats. One could even make the argument that endpoint detection and response is a form of advanced threat protection.
NOT JUST TOOLS, BUT CAPABILITIES

EDR
Endpoint detection and response tools work by monitoring endpoint and network events and recording the information in a central database where further analysis, detection, investigation, reporting, and alerting take place. A software agent installed on the host system provides the foundation for event monitoring and reporting.
Ongoing monitoring and detection are facilitated through the use of analytic tools. These tools identify tasks that can improve a company's overall state of security by identifying, responding to, and deflecting internal threats and external attacks.

EDR
http://download.sangfor.com.cn/Uploads/File/edr/_EDR_.pdf

macOS
     

macOS
https://en.wikipedia.org/wiki/File:MacOS_Architecture_v2.svg

macOS
 Core Services -> Security  Authentication <Security/Authorization.h>  Code Signing <Security/CodeSigning.h>
 Kernel -> BSD  Aduit <bsm/audit.h>  KAuth <bsd/sys/kauth.h>
 Kernel -> Mach  MACF <security/mac_policy.h>
 Kernel -> Networking  NKE <sys/kpi_socketfilter.h>

macOS
 Authd  syspolicyd  Gatekeeper  App Translocation  User-Approved kext  App Notarization  RootlessSIP  Sandbox  XProtect  MRT(Malware Removal Tool)  EndpointSecurity

macOSAgent
 Event & incident      

Event & incident
         

Event & incident
         

Event & incident
         

Enterprise Matrix - macOS

https://attack.mitre.org/matrices/enterprise/macos/

Event & incident
     
 syscall hook  Audit  Kauth  MACF hook    


         


         DDOS        Rootkit


         DDOS        Rootkit

+ 




         DDOS        Rootkit

+ 




         DDOS        Rootkit

+ 




         DDOS        Rootkit

+ 




             

MACF





